class RatingController < ApplicationController
  before_filter :find_chapter

  def rate
    @university = University.find(params[:university_id])
  end

  def create
    binding.pry
    @rating = Rating.new(rating_params)
    @rating.save

    redirect_to 
  end

  private

    def rating_params
      params.require(:rating)
    end

    def find_chapter
      klass = params[:chapter_type].classify.constantize
      @chapter = klass.find(params[:chapter_id])
    end
end
