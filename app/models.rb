# frozen_string_literal: true

Dir["#{APPLICATION_PATH}/app/models/concerns/*.rb"].each do |file| require file end
Dir["#{APPLICATION_PATH}/app/models/*.rb"].each do |file| require file end
