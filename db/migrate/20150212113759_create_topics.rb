class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.belongs_to :university, index: true
      t.string :subject, null: false

      t.timestamps
    end
  end
end
