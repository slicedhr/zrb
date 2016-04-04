class CreateCustodians < ActiveRecord::Migration
  def change
    create_table :custodians do |t|
      t.string :full_name
      t.string :office_work
      t.string :identification
      t.text :phones
      t.string :email

      t.timestamps null: false
    end
  end
end
