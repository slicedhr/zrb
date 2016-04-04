class CreateSubsidiaries < ActiveRecord::Migration
  def change
    create_table :subsidiaries do |t|
      t.text :address
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
