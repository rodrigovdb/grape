require 'yaml'
require 'grape'
require 'active_record'
require 'sqlite3'
require 'pry'

require_relative 'app'

APPLICATION_PATH = File.expand_path(File.dirname(__FILE__))

ActiveRecord::Base.logger = Logger.new('log/database.log')
configuration = YAML::load(IO.read('config/database.yml'))
ActiveRecord::Base.establish_connection(configuration['development'])

Dir["#{APPLICATION_PATH}/app/models/*.rb"].each { |file| require file }
