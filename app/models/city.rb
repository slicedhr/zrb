class City < ActiveRecord::Base

	has_many :subsidiaries
	has_many :af_assets
	
	validates :name, presence: true
	
end
