class Post < ActiveRecord::Base

  validates :nick_name, presence: true
  validates :message, presence: true

  belongs_to :topic
end
