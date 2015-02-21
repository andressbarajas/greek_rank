class RatingsController < ApplicationController
  before_filter :find_chapter

  def new
    @rating = Rating.new
  end

  def edit
  end

  def create
    @rating = @chapter.ratings.build(rating_params)
    @rating.calculate_average

    respond_to do |format|
      if @rating.save
        @chapter.calculate_percentages
        @chapter.save
        format.html { redirect_to @chapter, notice: 'Chapter rating was successfully created.' }
        format.json { render :show, status: :created, location: @chapter }
      else
        format.html { render :new }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rating.destroy
    @chapter.calculate_percentages
    @chapter.save

    respond_to do |format|
      format.html { redirect_to @chapter, notice: 'Chapter rating was successfully destroyed.' }
      format.json { head :no_content }
    end
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
