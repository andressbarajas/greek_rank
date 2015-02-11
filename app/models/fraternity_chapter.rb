class FraternityChapter < ActiveRecord::Base

  belongs_to :university
  belongs_to :fraternity, dependent: :destroy
end
