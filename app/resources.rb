# frozen_string_literal: true

Dir["#{APPLICATION_PATH}/app/resources/*.rb"].each do |file| require file end

module Vdb
  class API < Grape::API
    version 'v1', using: :path, vendor: 'rodrigovdb'
    format :json
    prefix :api

    mount Employees
    mount Products
  end
end
