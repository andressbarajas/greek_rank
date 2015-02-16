class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :nick_name, null: false
      t.string :message, null: false
      t.float :looks, null: false
      t.float :popularity, null: false
      t.float :classiness, null: false
      t.float :involvement, null: false
      t.float :socialness, null: false
      t.float :brotherhood, null: false
      
      t.integer :chapter_id, null: false
      t.string :chapter_type, null: false

      t.timestamps
    end
  end
end
