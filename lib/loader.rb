# frozen_string_literal: true

=begin
require 'yaml'
require 'grape'
require 'active_record'
require 'grape-active_model_serializers'
require 'sqlite3'
require 'bcrypt'
require 'pry'
require 'bundler/setup'
=end

RACK_ENV ||= 'development'

require 'rubygems'
require 'bundler/setup'

Bundler.require(:default, RACK_ENV.to_sym)


APPLICATION_PATH  ||= File.expand_path(File.dirname(__FILE__) + '/../')

ActiveRecord::Base.logger = Logger.new('log/database.log')
configuration = YAML.load(IO.read("#{APPLICATION_PATH}/config/database.yml"))
ActiveRecord::Base.establish_connection(configuration[RACK_ENV])

Dir["#{APPLICATION_PATH}/app/*.rb"].each do |file| require file end
