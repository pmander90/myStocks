desc "This task is called by the Heroku scheduler add-on"
task :texts => :environment do 
	Stock.text_everyone
end

