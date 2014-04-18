require 'active_model'
require 'yaml'
require 'active_record'
require 'active_record_tasks'
require 'pry-debugger'

module Timeline
	def self.db
		@__db_instance ||= Database::InMemory.new
	end	
end

require 'timeline/entity.rb'

Gem.find_files("timeline/database/*.rb").each { |path| require path }
Gem.find_files("timeline/entities/*.rb").each { |path| require path }
