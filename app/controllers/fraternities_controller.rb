class FraternitiesController < ApplicationController

  before_action :set_fraternity, only: [:show, :edit, :update, :destroy]
  before_filter :verify_is_admin, except: [:index, :show]

  def index
    @fraternities = Fraternity.order('name')
  end

  def show
    university_ids = FraternityChapter.where(fraternity_id: @fraternity.id)
                                      .order(overall_percentage: :desc).uniq
                                      .limit(5).map(&:university_id)
    unis = University.where(id: university_ids).group_by(&:id)
    @universities = university_ids.map { |id| unis[id].first }
  end

  def new
    @fraternity = Fraternity.new
  end

  def edit
  end

  def create
    @fraternity = Fraternity.new(fraternity_params)

    respond_to do |format|
      if @fraternity.save
        format.html { redirect_to @fraternity, notice: 'Fraternity was successfully created.' }
        format.json { render :show, status: :created, location: @fraternity }
      else
        format.html { render :new }
        format.json { render json: @fraternity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @fraternity.update(fraternity_params)
        format.html { redirect_to @fraternity, notice: 'Fraternity was successfully updated.' }
        format.json { render :show, status: :ok, location: @fraternity }
      else
        format.html { render :edit }
        format.json { render json: @fraternity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fraternity.destroy
    respond_to do |format|
      format.html { redirect_to fraternities_url, notice: 'Fraternity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fraternity
      @fraternity = Fraternity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fraternity_params
      params.require(:fraternity).permit(:name, :letters)
    end
end
