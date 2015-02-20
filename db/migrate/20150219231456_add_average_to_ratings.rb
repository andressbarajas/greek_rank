class AddAverageToRatings < ActiveRecord::Migration
  def up
    add_column :ratings, :average, :float, precision: 2, scale: 1

    # Backfill
    Rating.find_each do |rating|
      rating.average = ((rating.looks +
                         rating.popularity +
                         rating.classiness +
                         rating.involvement +
                         rating.socialness +
                         rating.brotherhood)/6).round(1)
      rating.save
    end
  end

  def down
    remove_column :ratings, :average, :float
  end
end
