class FraternityChapter < ActiveRecord::Base

  validate :one_fraternity_chapter_per_university, :on => :create

  belongs_to :university
  belongs_to :fraternity

  has_many :ratings, as: :chapter, dependent: :destroy

  def one_fraternity_chapter_per_university
    if FraternityChapter.exists?(university_id: self.university_id, fraternity_id: self.fraternity_id)
      errors.add(:university_id, 'already has an existing #{self.fraternity.name} chapter')
      errors.add(:fraternity_id, 'already has a chapter at #{self.university.name}')
    end
  end

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
