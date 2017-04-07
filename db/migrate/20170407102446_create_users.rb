class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :public_id,                                     limit: 12
      t.string    :email,               null: false
      t.string    :password_digest,     null: false
      t.string    :public_key,          null: false, unique: true
      t.string    :access_token
      t.timestamp :token_generated_at
      t.timestamp :last_login
      t.integer   :login_count

      t.timestamps null: false
    end
  end
end
