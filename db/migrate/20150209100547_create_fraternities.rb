class CreateFraternities < ActiveRecord::Migration
  def change
    create_table :fraternities do |t|
      t.string :name, null: false
      t.string :letters
      t.timestamps
    end
  end
end
