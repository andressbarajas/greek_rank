class SororityChapterController < ApplicationController

  before_action :set_sorority_chapter, only: [:show]
  
  def show
    @sorority = @chapter.sorority
    @university = @chapter.university
    @ratings = Rating.where(:chapter_id => @chapter.id).order('created_at DESC')

    @unity_name = "Sisterhood"

    @overall_percentage = (@ratings.average(:average)*20).round(1)
    @looks_percentage = (@ratings.average(:looks)*20).round(1)
    @popularity_percentage = (@ratings.average(:popularity)*20).round(1)
    @classiness_percentage = (@ratings.average(:classiness)*20).round(1)
    @involvement_percentage = (@ratings.average(:involvement)*20).round(1)
    @social_life_percentage = (@ratings.average(:socialness)*20).round(1)
    @unity_percentage = (@ratings.average(:brotherhood)*20).round(1) 
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
