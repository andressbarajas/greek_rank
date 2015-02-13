class TopicController < ApplicationController
  before_action :set_topic, only: [:show]

  def show
    @university = University.find(params[:university_id])
  end

  def create
    @university = University.find(params[:university_id])
    post = Post.new(nick_name: topic_params[:nick_name], message: topic_params[:message])
    @topic = Topic.new(subject: topic_params[:subject], university_id: @university.id)
    @topic.posts << post
    @topic.save

    redirect_to university_topic_path(@university, @topic)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:nick_name, :subject, :message)
    end
end
