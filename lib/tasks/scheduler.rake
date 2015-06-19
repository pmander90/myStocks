desc "This task is called by the Heroku scheduler add-on"
task :texts => :environment do 
	puts "doing something"

	puts "done"
end

