class CreateFraternityChapters < ActiveRecord::Migration
  def change
    create_table :fraternity_chapters do |t|
      t.belongs_to :university, index: true
      t.belongs_to :fraternity, index: true
      t.string :chapter_name, null: false

      t.timestamps
    end
  end
end