class SororityChapterController < ApplicationController

  before_action :set_sorority_chapter, only: [:show]
  
  def show
    @sorority = @chapter.sorority
    @university = @chapter.university
    @ratings = Rating.where(:chapter_id => @chapter.id).order('created_at ASC')
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
