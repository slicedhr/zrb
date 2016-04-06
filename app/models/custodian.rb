class Custodian < ActiveRecord::Base
	has_paper_trail
	has_many :af_assets

	validates :full_name, :office_work, :identification , presence: true
	
end
