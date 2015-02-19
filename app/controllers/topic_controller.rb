class TopicController < ApplicationController
  before_action :set_topic, only: [:show]

  def show
    @university = @topic.university
  end

  def create
    binding.pry
    @university = University.find(params[:university_id])
    @topic = @university.topics.build(subject: topic_params[:subject], 
                       nick_name: topic_params[:nick_name], 
                       message: topic_params[:message])
    @topic.save

    redirect_to topic_path(@topic)
  end

  def create_topic_reply
    @topic = Topic.find(params[:topic_id])
    post = Post.new(nick_name: topic_params[:nick_name], message: topic_params[:message])
    @topic.posts << post
    @topic.save
    
    redirect_to topic_path(@topic)
  end

  def create_post_reply
    @post = Post.find(topic_params[:post_id])
    @topic = Topic.find(params[:topic_id])
    post = Post.new(nick_name: topic_params[:nick_name], message: topic_params[:message], commentable_id: @post.id)
    @post.replies << post
    @post.save
    
    redirect_to topic_path(@topic)
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
