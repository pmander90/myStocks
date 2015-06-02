class Profile < ActiveRecord::Base
	belongs_to :user
	validates :username, :phone_number, presence: true
	validates :phone_number, numericality: true
	validates :phone_number, length: {is: 10} 
end
