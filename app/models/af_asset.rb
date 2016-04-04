class AfAsset < ActiveRecord::Base
	belongs_to :asset_name
	belongs_to :accounting_classification
	belongs_to :custodian
	belongs_to :internal_location
	belongs_to :subsidiary
	belongs_to :user
	belongs_to :root_category
	belongs_to :af_asset
	belongs_to :brand
	belongs_to :city
	belongs_to :supplier
	has_many :af_assets
	has_many :photos

	def getChildName(child)
		AssetName.where(id: child.asset_name)[0].name
	end
end
