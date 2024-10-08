class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :published, null: false, default: 0
      t.string :author, null: false
      t.timestamps
    end
  end
end
