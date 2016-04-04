class Custodian < ActiveRecord::Base

	has_many :af_assets

	validates :full_name, :office_work, :identification , presence: true
	
end
