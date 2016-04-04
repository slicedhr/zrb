class Brand < ActiveRecord::Base
	has_many :asset_names
	has_many :af_assets

	validates :name, presence: true

end
