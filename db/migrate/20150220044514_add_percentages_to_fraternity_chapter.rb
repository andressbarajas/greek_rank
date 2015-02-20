class AddPercentagesToFraternityChapter < ActiveRecord::Migration
  def up
    add_column :fraternity_chapters, :overall_percentage, :float, precision: 4, scale: 1
    add_column :fraternity_chapters, :looks_percentage, :float, precision: 4, scale: 1
    add_column :fraternity_chapters, :popularity_percentage, :float, precision: 4, scale: 1
    add_column :fraternity_chapters, :classiness_percentage, :float, precision: 4, scale: 1
    add_column :fraternity_chapters, :involvement_percentage, :float, precision: 4, scale: 1
    add_column :fraternity_chapters, :social_life_percentage, :float, precision: 4, scale: 1
    add_column :fraternity_chapters, :unity_percentage, :float, precision: 4, scale: 1

    # Backfill
    FraternityChapter.find_each do |fc|
      ratings = Rating.where(chapter_id: fc.id, chapter_type: "FraternityChapter")

      if !ratings.empty?
        fc.overall_percentage     = (ratings.average(:average)*20).round(1)
        fc.looks_percentage       = (ratings.average(:looks)*20).round(1)
        fc.popularity_percentage  = (ratings.average(:popularity)*20).round(1)
        fc.classiness_percentage  = (ratings.average(:classiness)*20).round(1)
        fc.involvement_percentage = (ratings.average(:involvement)*20).round(1)
        fc.social_life_percentage = (ratings.average(:socialness)*20).round(1)
        fc.unity_percentage       = (ratings.average(:brotherhood)*20).round(1) 
        fc.save
      end
    end
  end

  def down
    remove_column :fraternity_chapters, :overall_percentage
    remove_column :fraternity_chapters, :looks_percentage
    remove_column :fraternity_chapters, :popularity_percentage
    remove_column :fraternity_chapters, :classiness_percentage
    remove_column :fraternity_chapters, :involvement_percentage
    remove_column :fraternity_chapters, :social_life_percentage
    remove_column :fraternity_chapters, :unity_percentage
  end
end
