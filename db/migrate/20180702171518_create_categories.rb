class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|

      t.string :name, null: false, default: ""

      t.timestamps null: false
    end
  end
end
