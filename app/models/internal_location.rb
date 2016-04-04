class InternalLocation < ActiveRecord::Base
	validates :name,  presence: true
end
