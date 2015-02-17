class FraternityChapter < ActiveRecord::Base

  belongs_to :university
  belongs_to :fraternity

  has_many :ratings, as: :chapter, dependent: :destroy
end
