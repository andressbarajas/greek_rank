class FraternityChapter < ActiveRecord::Base

  belongs_to :university
  belongs_to :fraternity

  has_many :ratings, as: :chapter, dependent: :destroy

  def calculate_percentages
    ratings = Rating.where(chapter_id: self.id, chapter_type: "FraternityChapter")
    self.overall_percentage = (ratings.average(:average)*20).round(1)
    self.looks_percentage = (ratings.average(:looks)*20).round(1)
    self.popularity_percentage = (ratings.average(:popularity)*20).round(1)
    self.classiness_percentage = (ratings.average(:classiness)*20).round(1)
    self.involvement_percentage = (ratings.average(:involvement)*20).round(1)
    self.social_life_percentage = (ratings.average(:socialness)*20).round(1)
    self.unity_percentage = (ratings.average(:brotherhood)*20).round(1) 
  end
end
