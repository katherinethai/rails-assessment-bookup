class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :text
      t.string :img_link
      t.string :amazon_link

      t.timestamps null: false
    end
  end
end
