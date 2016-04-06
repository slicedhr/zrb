class AssetName < ActiveRecord::Base
  has_paper_trail
  belongs_to :brand
  belongs_to :supplier
  belongs_to :accounting_classification
  before_create :set_joined_name
  before_save :set_joined_name
  validates :name, :width, :height, :depth, presence: true

  protected 

  def set_joined_name
  	self.joined = "#{self.name} #{self.width}*#{self.height}*#{self.depth} #{self.brand.name if self.brand}"
  end


end
