class Topic < ActiveRecord::Base

  validates :subject, presence: true
  validates :nick_name, presence: true
  validates :message, presence: true

  belongs_to :university
  has_many :posts, as: :commentable, dependent: :destroy
end
