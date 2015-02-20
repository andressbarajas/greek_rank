class AddPercentagesToSororityChapter < ActiveRecord::Migration
  def up
    add_column :sorority_chapters, :overall_percentage, :float, precision: 4, scale: 1
    add_column :sorority_chapters, :looks_percentage, :float, precision: 4, scale: 1
    add_column :sorority_chapters, :popularity_percentage, :float, precision: 4, scale: 1
    add_column :sorority_chapters, :classiness_percentage, :float, precision: 4, scale: 1
    add_column :sorority_chapters, :involvement_percentage, :float, precision: 4, scale: 1
    add_column :sorority_chapters, :social_life_percentage, :float, precision: 4, scale: 1
    add_column :sorority_chapters, :unity_percentage, :float, precision: 4, scale: 1

    # Backfill
    SororityChapter.find_each do |sc|
      ratings = Rating.where(chapter_id: sc.id, chapter_type: "SororityChapter")

      if !ratings.empty?
        sc.overall_percentage     = (ratings.average(:average)*20).round(1)
        sc.looks_percentage       = (ratings.average(:looks)*20).round(1)
        sc.popularity_percentage  = (ratings.average(:popularity)*20).round(1)
        sc.classiness_percentage  = (ratings.average(:classiness)*20).round(1)
        sc.involvement_percentage = (ratings.average(:involvement)*20).round(1)
        sc.social_life_percentage = (ratings.average(:socialness)*20).round(1)
        sc.unity_percentage       = (ratings.average(:brotherhood)*20).round(1) 
        sc.save
      end
    end
  end

  def down
    remove_column :sorority_chapters, :overall_percentage
    remove_column :sorority_chapters, :looks_percentage
    remove_column :sorority_chapters, :popularity_percentage
    remove_column :sorority_chapters, :classiness_percentage
    remove_column :sorority_chapters, :involvement_percentage
    remove_column :sorority_chapters, :social_life_percentage
    remove_column :sorority_chapters, :unity_percentage
  end
end
