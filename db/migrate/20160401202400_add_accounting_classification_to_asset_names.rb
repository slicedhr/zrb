class AddAccountingClassificationToAssetNames < ActiveRecord::Migration
  def change
    add_reference :asset_names, :accounting_classification, index: true, foreign_key: true
  end
end
