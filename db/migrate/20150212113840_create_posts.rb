class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :topic, index: true
      t.string :nick_name, null: false
      t.text :message, null: false
      t.integer :parent_post_id

      t.timestamps
    end
  end
end
