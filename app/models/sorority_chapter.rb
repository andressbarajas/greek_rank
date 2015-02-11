class SororityChapter < ActiveRecord::Base

  belongs_to :university
  belongs_to :sorority, dependent: :destroy
end
