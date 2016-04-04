class CreateAccountingClassifications < ActiveRecord::Migration
  def change
    create_table :accounting_classifications do |t|
      t.string :account
      t.string :name
      t.string :ifrs_value
      t.string :local_value

      t.timestamps null: false
    end
  end
end
