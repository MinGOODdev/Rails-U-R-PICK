class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|

      t.string :content
      t.integer :category_id
      t.integer :user_id
      t.string :img_url_1, null: false, default: ""
      t.string :img_url_2, null: false, default: ""

      t.timestamps null: false
    end
  end
end
