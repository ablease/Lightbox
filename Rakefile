require 'data_mapper'
require './lib/data_mapper_setup'

ENV['CODECLIMATE_REPO_TOKEN']

task :auto_upgrade do 
	DataMapper.auto_upgrade!
	puts "Auto upgrade complete"
end

task :auto_migrate do 
	DataMapper.auto_migrate!
	puts "Auto migrate complete"
end