desc
task :texts => :environment do 
	puts "doing something"
	Stock.texteveryone
	puts "done"
end

