class SororityChapter < ActiveRecord::Base

  belongs_to :university
  belongs_to :sorority

  has_many :ratings, as: :chapter, dependent: :destroy
end
