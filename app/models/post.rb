class Post < ActiveRecord::Base

  validates :nick_name, presence: true
  validates :message, presence: true

  belongs_to :topic
  belongs_to :parent, class_name: "Post", foreign_key: "parent_post_id"
  has_many :replies, class_name: "Post", foreign_key: "parent_post_id", dependent: :destroy
end
