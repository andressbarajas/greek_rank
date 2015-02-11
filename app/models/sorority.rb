class Sorority < ActiveRecord::Base

  validates :name, presence: true

  has_many :sorority_chapters
end
