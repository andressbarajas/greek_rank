class SororityChapter < ActiveRecord::Base

  validate :one_sorority_chapter_per_university, :on => :create

  belongs_to :university
  belongs_to :sorority

  has_many :ratings, as: :chapter, dependent: :destroy

  def one_sorority_chapter_per_university
    if SororityChapter.exists?(university_id: self.university_id, sorority_id: self.sorority_id)
      errors.add(:university_id, 'already has an existing #{self.sorority.name} chapter')
      errors.add(:sorority_id, 'already has a chapter at #{self.university.name}')
    end
  end

  def calculate_percentages
    ratings = Rating.where(chapter_id: self.id, chapter_type: "SororityChapter")
    self.overall_percentage = (ratings.average(:average)*20).round(1)
    self.looks_percentage = (ratings.average(:looks)*20).round(1)
    self.popularity_percentage = (ratings.average(:popularity)*20).round(1)
    self.classiness_percentage = (ratings.average(:classiness)*20).round(1)
    self.involvement_percentage = (ratings.average(:involvement)*20).round(1)
    self.social_life_percentage = (ratings.average(:socialness)*20).round(1)
    self.unity_percentage = (ratings.average(:brotherhood)*20).round(1) 
  end
end
