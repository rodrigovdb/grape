# frozen_string_literal: true

Dir["#{APPLICATION_PATH}/app/serializers/*.rb"].each do |file| require file end
