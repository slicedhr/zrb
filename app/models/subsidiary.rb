class Subsidiary < ActiveRecord::Base
  belongs_to :city
  validates :address, :city_id, presence: true
end
