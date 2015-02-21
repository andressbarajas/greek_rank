class Fraternity < ActiveRecord::Base

  validates :name, presence: true

  has_many :fraternity_chapters, dependent: :destroy
end
