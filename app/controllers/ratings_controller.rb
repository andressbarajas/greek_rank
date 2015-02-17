class RatingsController < ApplicationController
  before_filter :find_chapter

  def new
    @rating = @chapter.ratings.new
  end

  def create
    @rating = @chapter.ratings.new(rating_params)
    @rating.save

    redirect_to @chapter
  end

  private

    def rating_params
      params.require(:rating).permit(:nick_name, 
                                     :message, 
                                     :looks, 
                                     :popularity, 
                                     :classiness, 
                                     :involvement, 
                                     :socialness, 
                                     :brotherhood)
    end

    def find_chapter
      klass = [FraternityChapter, SororityChapter].detect { |c| params["#{c.name.underscore}_id"] }
      @chapter = klass.find(params["#{klass.name.underscore}_id"])
    end
end
