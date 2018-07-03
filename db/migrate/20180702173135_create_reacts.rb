class CreateReacts < ActiveRecord::Migration[5.1]
  def change
    create_table :reacts do |t|

      t.integer :user_id
      t.integer :post_id
      t.string :img_url

      t.timestamps null:false
    end
  end
end
