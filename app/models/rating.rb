class Rating < ActiveRecord::Base

  MIN_STARS = 0.0
  MAX_STARS = 5.0

  validates :nick_name, presence: true
  validates :message, presence: true
  validates :looks, presence: true, :numericality => { greater_than: MIN_STARS, less_than_or_equal_to: MAX_STARS }
  validates :popularity, presence: true, :numericality => { greater_than: MIN_STARS, less_than_or_equal_to: MAX_STARS }
  validates :classiness, presence: true, :numericality => { greater_than: MIN_STARS, less_than_or_equal_to: MAX_STARS }
  validates :involvement, presence: true, :numericality => { greater_than: MIN_STARS, less_than_or_equal: MAX_STARS }
  validates :socialness, presence: true, :numericality => { greater_than: MIN_STARS, less_than_or_equal_to: MAX_STARS }
  validates :brotherhood, presence: true, :numericality => { greater_than: MIN_STARS, less_than_or_equal_to: MAX_STARS }

  belongs_to :chapter, polymorphic: true

  def calculate_average
    total = looks + popularity + classiness + involvement + socialness + brotherhood
    self.average = (total/6).round(1)
    save
  end
end
