class CreateImgs < ActiveRecord::Migration[5.1]
  def change
    create_table :imgs do |t|

      t.integer :post_id
      t.string :img_url
      t.string :like_count, default: 0

      t.timestamps null: false
    end
  end
end
