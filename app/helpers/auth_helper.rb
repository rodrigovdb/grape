# frozen_string_literal: true

module AuthHelper
  def authenticate
    method = authentication_method

    if method == :email
      User.authenticate_with_email(params.email, params.password)
    elsif method == :public_key
      User.authenticate_with_public_key(params.public_key, params.password)
    end
  end

  def check_authentication
    raise InvalidToken unless headers.key?('Xauthtoken')

    token = headers['Xauthtoken']
    user  = User.find_by(access_token: token)

    raise InvalidToken if user.nil?
    raise ExpiredToken if user.expired?

    user.update_token_expiration

    params.current_user = user
  end

  private

  def authentication_method
    email       = params[:email]
    public_key  = params[:public_key]
    method      = nil

    if email
      method = :email
    elsif public_key
      method = :public_key
    end

    method
  end
end
