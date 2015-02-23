class WelcomeController < ApplicationController

  before_filter :verify_is_admin, only: [:new_article, :create_article, :update_article, :destroy_article]

  def index
    @articles = Article.order('created_at DESC')
  end

  def new_article
  end

  def create_article
    @welcome = Article.new(welcome_params)
    respond_to do |format|
      if @welcome.save
        format.html { redirect_to root_path, notice: 'University was successfully created.' }
      else
        format.html { render :new_article }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
    def welcome_params
      params.require(:welcome).permit(:url, :title, :summary, :image_url)
    end
end
