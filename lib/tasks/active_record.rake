# frozen_string_literal: true

require 'yaml'
require 'active_record'

include ActiveRecord::Tasks

class Seeder
  def initialize(seed_file)
    @seed_file = seed_file
  end

  def load_seed
    raise "Seed file '#{@seed_file}' does not exist" unless File.file?(@seed_file)
    load @seed_file
  end
end

root = APPLICATION_PATH
DatabaseTasks.env = ENV['RACK_ENV'] || 'development'

DatabaseTasks.database_configuration = YAML.safe_load(File.read('config/database.yml'))
DatabaseTasks.db_dir = File.join root, 'db'
DatabaseTasks.fixtures_path = File.join root, 'test/fixtures'
DatabaseTasks.migrations_paths = [File.join(root, 'db/migrate')]
DatabaseTasks.seed_loader = Seeder.new File.join root, 'db/seeds.rb'
DatabaseTasks.root = root

task :environment do
  ActiveRecord::Base.configurations = DatabaseTasks.database_configuration
  ActiveRecord::Base.establish_connection DatabaseTasks.env.to_sym
end

load 'active_record/railties/databases.rake'

namespace :g do
  desc 'Generate migration. Specify name in the NAME variable'
  task migration: :environment do
    name = ENV['NAME'] || raise('Specify name: rake g:migration NAME=create_users')
    timestamp = Time.now.strftime('%Y%m%d%H%M%S')

    path = File.expand_path("#{APPLICATION_PATH}/db/migrate/#{timestamp}_#{name}.rb", __FILE__)
    migration_class = name.split('_').map(&:capitalize).join

    # File.open(path, 'w') do |file|
    #   file.write <<-EOF.strip_heredoc
    #     class #{migration_class} < ActiveRecord::Migration
    #       def self.up
    #       end
    #       def self.down
    #       end
    #     end
    #   EOF
    # end

    File.open(path, 'w') do |file|
      file.write <<-EOF.strip_heredoc
        class #{migration_class} < ActiveRecord::Migration
          def change
          end
        end
      EOF
    end

    puts 'DONE'
    puts path
  end
end
