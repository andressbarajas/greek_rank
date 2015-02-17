class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :commentable, polymorphic: true
      t.string :nick_name, null: false
      t.text :message, null: false

      t.timestamps
    end

    add_index :posts, [:commentable_id, :commentable_type]
  end
end
