# frozen_string_literal: true

Dir["#{APPLICATION_PATH}/app/models/*.rb"].each do |file| require file end
