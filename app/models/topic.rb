class Topic < ActiveRecord::Base

  validates :subject, presence: true
  validates :posts, presence: true

  belongs_to :university
  has_many :posts
end
