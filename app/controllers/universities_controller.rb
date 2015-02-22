class UniversitiesController < ApplicationController
  layout "application", only: [:index]

  before_action :set_university, except: [:index, :new, :create, :search] 
  before_filter :verify_is_admin, only: [:new, :edit, :create, :update, :destroy]

  # Sidebar
  before_filter :uni_sidebar_vars, except: :index

  def index
    @universities = University.all
  end

  def show
    @fraternity_chapter_count = @university.fraternity_chapters.count
    @fraternity_chapters = @university.fraternity_chapters.order(overall_percentage: :desc).limit(5)
    @sorority_chapter_count = @university.sorority_chapters.count
    @sorority_chapters = @university.sorority_chapters.order(overall_percentage: :desc).limit(5)
    @discussion_count = @university.topics.count
    @discussions = @university.topics.order('updated_at DESC').limit(2)
  end

  def new
    @university = University.new
  end

  def edit
  end

  def discussion
    @discussions = @university.topics.order('updated_at DESC')
  end

  def fraternities
    @chapters = @university.fraternity_chapters.joins(:fraternity).order("fraternities.name")
  end

  def sororities
    @chapters = @university.sorority_chapters.joins(:sorority).order("sororities.name")
  end

  def create
    @university = University.new(university_params)

    respond_to do |format|
      if @university.save
        format.html { redirect_to @university, notice: 'University was successfully created.' }
        format.json { render :show, status: :created, location: @university }
      else
        format.html { render :new }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @university.update(university_params)
        format.html { redirect_to @university, notice: 'University was successfully updated.' }
        format.json { render :show, status: :ok, location: @university }
      else
        format.html { render :edit }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @university.destroy
    respond_to do |format|
      format.html { redirect_to universities_url, notice: 'University was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    if params[:search].present?
      @universities = University.search(params[:search])
    else
      @universities = University.all
    end
  end

  private

    def uni_sidebar_vars
      @uni_discs = @university.topics.order('updated_at DESC').limit(3)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_university
      @university = University.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def university_params
      params.require(:university).permit(:name, :initials)
    end
end
