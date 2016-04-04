class AddAfAssetToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :af_asset, index: true, foreign_key: true
  end
end
