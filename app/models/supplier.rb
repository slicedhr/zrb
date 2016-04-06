class Supplier < ActiveRecord::Base
	has_paper_trail
	has_many :asset_names
end
