class SororityChapterController < ApplicationController

  before_action :set_sorority_chapter, only: [:show]

  def index
  end

  def show
    @sorority = @chapter.sorority
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
