class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name, null: false
      t.string :initials, null: false
      t.timestamps
    end
  end
end
