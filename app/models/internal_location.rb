class InternalLocation < ActiveRecord::Base
	has_paper_trail
	validates :name,  presence: true
end
