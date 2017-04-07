module Authenticable
  extend ActiveSupport::Concern

  included do
    attr_accessor :updating

    has_secure_password

    before_validation(on: :update) do
      @updating = true
    end

    validates :password, length: { minimum: 8 }, allow_nil: true, on: :create
    validates_strength_of :password, with: :email, level: :good,  on: :create

    # if it's an update, run password validations if password is present
    with_options if: :updating? do |if_present|
      if_present.validates :password, length: { minimum: 8 }, allow_nil: true, if: :password?
      if_present.validates_strength_of :password, with: :email, level: :good, if: :password?
    end

    def self.authenticate_with_email(email, password)
      authenticate :email, email, password
    end

    def self.authenticate_with_public_key(public_key, password)
      authenticate :public_key, public_key, password
    end

    def self.authenticate(attr_name, attr_value, clear_password)
      user = User.find_by attr_name => attr_value
      return false if user.nil?

      user = user.authenticate clear_password
      return false unless user

      user.update access_token: user.generate_token, token_generated_at: Time.new

      user
    end

    def admin?
      is_admin
    end

    private_class_method :authenticate
  end

  def updating?
    return true if updating
    false
  end

  def password?
    return true if password
    false
  end

  def generate_values
    self.public_key = Digest::MD5.hexdigest "My amazing public key is #{email}"
  end

  def expired?
    token_generated_at <= Time.new - 1.day
  end

  def update_token_expiration
    update token_generated_at: Time.new
  end

  def generate_token
    Digest::MD5.hexdigest id.to_s + Time.new.to_s
  end

  def send_password_reset
    self.reset_password_token   = SecureRandom.urlsafe_base64
    self.reset_password_sent_at = Time.now

    # Setting the password_confirmation just so the tests won't fail.
    # Normally a password isn't accessible on user object
    # but when creating a user with FactryGirl both password and confirmation
    # are accessible which will cause error on saving
    temp_password              = SecureRandom.urlsafe_base64
    self.password              = temp_password
    self.password_confirmation = temp_password

    enqueue reset_password_message, 'emailer' if save!
  end

  def reset_password_message
    link = "http://imagewiki.github.io/website/#/password-reset/#{reset_password_token}"
    body = '<h1>ImageWiki</h1>' \
           '<p>You or someone else requested to recover your password on ImageWiki.<br>' \
           "To proceed and reset your password you need to go to this <a href=\"#{link}\">link</a>.<br>" \
           "Or copy and past this url on you browser:</p><h3>#{link}</h3>"
    {
      to: email,
      subject: 'ImageWiki password recovery instructions',
      body: body
    }.to_json
  end
end
