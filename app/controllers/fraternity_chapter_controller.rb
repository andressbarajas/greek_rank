class FraternityChapterController < ApplicationController

  before_action :set_fraternity_chapter, only: [:show]

  def index
  end

  def show
    @fraternity = @chapter.fraternity
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fraternity_chapter
      @chapter = FraternityChapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fraternity_chapter_params
      params[:fraternity_chapter]
    end
end
