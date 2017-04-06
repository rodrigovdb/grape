# frozen_string_literal: true

require 'yaml'
require 'grape'
require 'active_record'
require 'grape-active_model_serializers'
require 'sqlite3'
require 'pry'

APPLICATION_PATH  ||= File.expand_path(File.dirname(__FILE__) + '/../')
RACK_ENV          ||= 'development'

ActiveRecord::Base.logger = Logger.new('log/database.log')
configuration = YAML.load(IO.read("#{APPLICATION_PATH}/config/database.yml"))
ActiveRecord::Base.establish_connection(configuration[RACK_ENV])

Dir["#{APPLICATION_PATH}/app/*.rb"].each do |file| require file end
