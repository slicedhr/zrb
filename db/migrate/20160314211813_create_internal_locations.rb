class CreateInternalLocations < ActiveRecord::Migration
  def change
    create_table :internal_locations do |t|
      t.string :name
      t.boolean :activated

      t.timestamps null: false
    end
  end
end
