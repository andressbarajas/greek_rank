class University < ActiveRecord::Base
  searchkick

  default_scope { order('name') }

  validates :name, presence: true
  validates :initials, presence: true

  has_many :fraternity_chapters
  has_many :sorority_chapters
end
