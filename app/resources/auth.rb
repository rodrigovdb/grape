# frozen_string_literal: true

module Vdb
  class Auth < Grape::API
    # version   'v1',   using: :path, vendor: 'rodrigovdb'
    format    :json

    resource :auth do
      desc 'Authenticate user'

      params do
        requires :public_key, type: String
        requires :password,   type: String
      end

      post do
        user  = authenticate

        unless user
          status 401
          return { error: { authentication: 'Specified public_key or password is incorrect' } }
        end

				{ token: user.access_token }
      end
    end
  end
end
