class RootCategory < ActiveRecord::Base
	validates :text, presence: true
end
