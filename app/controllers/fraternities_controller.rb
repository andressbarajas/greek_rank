class FraternitiesController < ApplicationController
  before_action :set_fraternity, only: [:show, :edit, :update, :destroy]

  # GET /fraternities
  # GET /fraternities.json
  def index
    @fraternities = Fraternity.order('name')
  end

  # GET /fraternities/1
  # GET /fraternities/1.json
  def show
    university_ids = FraternityChapter.where(:fraternity_id => @fraternity.id).map(&:university_id)
    @universities = University.where(:id => university_ids)
  end

  # GET /fraternities/new
  def new
    @fraternity = Fraternity.new
  end

  # GET /fraternities/1/edit
  def edit
  end

  # POST /fraternities
  # POST /fraternities.json
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

  # PATCH/PUT /fraternities/1
  # PATCH/PUT /fraternities/1.json
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

  # DELETE /fraternities/1
  # DELETE /fraternities/1.json
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
