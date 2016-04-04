class AddBrandToAfAssets < ActiveRecord::Migration
  def change
    add_reference :af_assets, :brand, index: true, foreign_key: true
  end
end
