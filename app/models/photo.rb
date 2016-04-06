class Photo < ActiveRecord::Base
	has_paper_trail
	belongs_to :af_asset
end
