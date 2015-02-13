class TopicController < ApplicationController
  before_action :set_topic, only: [:show]

  def show
    @university = University.find(params[:university_id])
  end

  def create
    @university = University.find(params[:university_id])
    @topic = Topic.new(subject: topic_params[:subject], 
                       nick_name: topic_params[:nick_name], 
                       message: topic_params[:message],
                       university_id: @university.id)
    @topic.save

    redirect_to university_topic_path(@university, @topic)
  end

  def create_topic_reply
    @university = University.find(params[:university_id])
    @topic = Topic.find(params[:topic_id])
    post = Post.new(nick_name: topic_params[:nick_name], message: topic_params[:message])
    @topic.posts << post
    @topic.save
    
    redirect_to university_topic_path(@university, @topic)
  end

  def create_post_reply
    @post = Post.find(topic_params[:post_id])
    @university = University.find(params[:university_id])
    @topic = Topic.find(params[:topic_id])
    post = Post.new(nick_name: topic_params[:nick_name], message: topic_params[:message], parent_post_id: @post.id)
    @post.replies << post
    @post.save
    
    redirect_to university_topic_path(@university, @topic)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:nick_name, :subject, :message, :post_id)
    end
end
