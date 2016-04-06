class RootCategory < ActiveRecord::Base
	has_paper_trail
	validates :text, presence: true
end
