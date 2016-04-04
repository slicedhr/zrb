class AddCityToAfAssets < ActiveRecord::Migration
  def change
    add_reference :af_assets, :city, index: true, foreign_key: true
  end
end
