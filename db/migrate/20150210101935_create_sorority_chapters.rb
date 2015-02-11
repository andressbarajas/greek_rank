class CreateSororityChapters < ActiveRecord::Migration
  def change
    create_table :sorority_chapters do |t|
      t.belongs_to :university, index: true
      t.belongs_to :sorority, index: true
      t.string :chapter_name, null: false
      t.timestamps
    end
  end
end
