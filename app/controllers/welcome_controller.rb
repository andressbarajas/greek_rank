class WelcomeController < ApplicationController

  before_action :set_article, except: [:index, :new, :create] 
  before_filter :verify_is_admin, only: [:new_article, :create_article, :update_article, :destroy_article]

  def index
    @articles = Article.order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def update
  end

  def create
    @article = Article.new(welcome_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to root_path, notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(welcome_params)
        format.html { redirect_to root_path, notice: 'University was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to welcome_url, notice: 'University was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def welcome_params
      params.require(:welcome).permit(:url, :title, :summary, :image_url)
    end
end
