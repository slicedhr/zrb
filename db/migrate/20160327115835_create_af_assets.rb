class CreateAfAssets < ActiveRecord::Migration
  def change
    create_table :af_assets do |t|
    	t.references :asset_name, index: true, foreign_key: true
		t.integer :quantity, default: 1
		t.string :serial, default: 'NA'
		t.string :model, default: 'NA'
		t.string :reference, default: 'NA'
		t.string :tech_plaque, default: 'NA'
		t.string :old_plaque
		t.string :current_plaque
		t.text :characteristics, default: 'NA'
		t.text :comments, default: 'NA'
		t.decimal :purchase_value
		t.date :purchase_date
		t.integer :age
		t.decimal :factor_m
		t.decimal :factor_r
		t.string :vuef
		t.decimal :reposition_price
		t.string :accounting_crossing
		t.boolean :is_parent, default: true
		t.references :accounting_classification, index: true, foreign_key: true
		t.references :custodian, index: true, foreign_key: true
		t.references :internal_location, index: true, foreign_key: true
		t.references :subsidiary, index: true, foreign_key: true
		t.references :user, index: true, foreign_key: true
		t.references :root_category, index: true, foreign_key: true
		t.references :af_asset, index: true, foreign_key: true
		t.boolean :is_verifiqued

		t.timestamps null: false
    end
  end
end
