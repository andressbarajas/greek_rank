class FraternityChaptersController < ApplicationController
  layout "universities", only: [:show]

  before_action :set_fraternity_chapter, only: [:show, :edit, :update, :destroy]
  before_filter :verify_is_admin, only: [:new, :edit, :create, :update, :destroy]

  # Sidebar
  before_filter :uni_sidebar_vars, only: :show

  def show
    @fraternity = @chapter.fraternity
    @university = @chapter.university
    @ratings = Rating.where(chapter_id: @chapter.id, chapter_type: "FraternityChapter").order('created_at DESC')

    @unity_name = "Brotherhood"
  end

  def new
    @chapter = FraternityChapter.new
    @university = University.find(params[:university_id])
  end

  def edit
  end

  def create
    @chapter = FraternityChapter.new(fraternity_chapter_params)
  
    respond_to do |format|
      if @chapter.save
        format.html { redirect_to @chapter, notice: 'Fraternity Chapter was successfully created.' }
        format.json { render :show, status: :created, location: @chapter }
      else
        format.html { redirect_to action: :new }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @chapter.update(fraternity_chapter_params)
        format.html { redirect_to @chapter, notice: 'Fraternity Chapter was successfully updated.' }
        format.json { render :show, status: :ok, location: @chapter }
      else
        format.html { render :edit }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chapter.destroy
    respond_to do |format|
      format.html { redirect_to fraternities_path, notice: 'Fraternity Chapter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def uni_sidebar_vars
      @uni_discs = @chapter.university.topics.order('updated_at DESC').limit(3)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_fraternity_chapter
      @chapter = FraternityChapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fraternity_chapter_params
      params.require(:fraternity_chapter).permit(:university_id, :fraternity_id, :chapter_name)
    end
end
