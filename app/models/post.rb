class Post < ActiveRecord::Base

  validates :nick_name, presence: true
  validates :message, presence: true

  belongs_to :topic
  belongs_to :commentable, polymorphic: true

  has_many :replies, class_name: "Post", as: :commentable, dependent: :destroy
end
