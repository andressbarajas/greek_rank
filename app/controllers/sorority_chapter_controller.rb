class SororityChapterController < ApplicationController

  before_action :set_sorority_chapter, only: [:show]
  
  def show
    @sorority = @chapter.sorority
    @university = @chapter.university
    @ratings = Rating.where(:chapter_id => @chapter.id).order('created_at DESC')

    @unity_name = "Sisterhood"

    @looks_percentage = @ratings.average(:looks).round(2) * 20
    @popularity_percentage = @ratings.average(:popularity).round(2) * 20
    @classiness_percentage = @ratings.average(:classiness).round(2) * 20
    @involvement_percentage = @ratings.average(:involvement).round(2) * 20
    @social_life_percentage = @ratings.average(:socialness).round(2) * 20
    @unity_percentage = @ratings.average(:brotherhood).round(2) * 20

    overall_sum = @ratings.average(:looks) + 
                  @ratings.average(:popularity) + 
                  @ratings.average(:classiness) + 
                  @ratings.average(:involvement) + 
                  @ratings.average(:socialness) + 
                  @ratings.average(:brotherhood)

    @overall_percentage = ((overall_sum/6) * 20).round(2)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sorority_chapter
      @chapter = SororityChapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sorority_chapter_params
      params[:sorority_chapter]
    end
end
