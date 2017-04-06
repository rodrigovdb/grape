# frozen_string_literal: true

Dir["#{APPLICATION_PATH}/app/resources/v1/*.rb"].each do |file| require file end

module Vdb
  class V1 < Grape::API
    version   'v1',   using: :path, vendor: 'rodrigovdb'
    format    :json
    formatter :json,  Grape::Formatter::ActiveModelSerializers

    mount Employees
    mount Products
  end
end
