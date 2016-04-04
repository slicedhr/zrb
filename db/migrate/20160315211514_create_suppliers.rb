class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :nit
      t.string :phone
      t.text :address

      t.timestamps null: false
    end
  end
end
