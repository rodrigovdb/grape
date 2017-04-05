require "active_record"
require "seed_dump"

APPLICATION_PATH = File.expand_path(File.dirname(__FILE__))

Dir.glob('./lib/tasks/*.rake').each { |r| import r }

load 'tasks/seed_dump.rake'
