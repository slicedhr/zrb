class Subsidiary < ActiveRecord::Base
	has_paper_trail
	belongs_to :city
	validates :address, :city_id, presence: true
end
