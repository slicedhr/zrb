class CreateRootCategories < ActiveRecord::Migration
  def change
    create_table :root_categories do |t|
      t.string :text

      t.timestamps null: false
    end
  end
end
