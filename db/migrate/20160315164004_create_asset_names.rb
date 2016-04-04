class CreateAssetNames < ActiveRecord::Migration
  def change
    create_table :asset_names do |t|
      t.string :name
      t.string :height
      t.string :width
      t.string :depth
      t.text :joined
      t.text :source
      t.decimal :purchase_price
      t.references :brand, index: true, foreign_key: true
      t.integer :useful_life

      t.timestamps null: false
    end
  end
end
