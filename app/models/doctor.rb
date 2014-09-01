class Doctor < ActiveRecord::Base
belongs_to :user
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :address, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip_code, presence: true
	validates :telephone, presence: true

	geocoded_by :location
  after_validation :geocode
end
end
