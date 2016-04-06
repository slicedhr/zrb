class AccountingClassification < ActiveRecord::Base
	has_paper_trail
	has_many :asset_names
	has_many :af_assets
	validates :account, :name, :ifrs_value, :local_value, presence: true

end
