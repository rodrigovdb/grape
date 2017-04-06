# frozen_string_literal: true

Dir["#{APPLICATION_PATH}/app/resources/*.rb"].each do |file| require file end

module Vdb
  class API < Grape::API
    prefix    :api

    mount V1
  end
end
