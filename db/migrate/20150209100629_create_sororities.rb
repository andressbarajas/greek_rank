class CreateSororities < ActiveRecord::Migration
  def change
    create_table :sororities do |t|
      t.string :name, null: false
      t.string :letters
      t.timestamps
    end
  end
end
