class SororitiesController < ApplicationController
  before_action :set_sorority, only: [:show, :edit, :update, :destroy]
  before_filter :verify_is_admin, except: [:index, :show]

  def index
    @sororities = Sorority.all
  end

  def show
    university_ids = SororityChapter.where(sorority_id: @sorority.id)
                                    .order(overall_percentage: :desc)
                                    .limit(5).map(&:university_id)
    unis = University.where(id: university_ids).group_by(&:id)
    @universities = university_ids.map { |id| unis[id].first }
  end

  def new
    @sorority = Sorority.new
  end

  def edit
  end

  def create
    @sorority = Sorority.new(sorority_params)

    respond_to do |format|
      if @sorority.save
        format.html { redirect_to @sorority, notice: 'Sorority was successfully created.' }
        format.json { render :show, status: :created, location: @sorority }
      else
        format.html { render :new }
        format.json { render json: @sorority.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sorority.update(sorority_params)
        format.html { redirect_to @sorority, notice: 'Sorority was successfully updated.' }
        format.json { render :show, status: :ok, location: @sorority }
      else
        format.html { render :edit }
        format.json { render json: @sorority.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sorority.destroy
    respond_to do |format|
      format.html { redirect_to sororities_url, notice: 'Sorority was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sorority
      @sorority = Sorority.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sorority_params
      params.require(:sorority).permit(:name, :letters)
    end
end
