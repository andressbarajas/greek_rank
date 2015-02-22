class TopicController < ApplicationController
  before_action :set_topic, only: [:show, :destroy]

  def show
    @university = @topic.university
  end

  def create
    @university = University.find(params[:university_id])
    @topic = @university.topics.build(subject: topic_params[:subject], 
                                      nick_name: topic_params[:nick_name], 
                                      message: topic_params[:message])
    respond_to do |format|
      if @topic.save
        @topic.touch
        format.html { redirect_to topic_path(@topic) }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render discussion_university_path(@university) }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_topic_reply
    @topic = Topic.find(params[:topic_id])
    post = Post.new(nick_name: topic_params[:nick_name], message: topic_params[:message])
    @topic.posts << post

    respond_to do |format|
      if @topic.save
        @topic.touch
        format.html { redirect_to topic_path(@topic) }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render topic_path(@topic) }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_post_reply
    @post = Post.find(topic_params[:post_id])
    @topic = Topic.find(params[:topic_id])
    post = Post.new(nick_name: topic_params[:nick_name], message: topic_params[:message], commentable_id: @post.id)
    @post.replies << post

    respond_to do |format|
      if @post.save
        @topic.touch
        format.html { redirect_to topic_path(@topic) }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render topic_path(@topic) }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_post
    @post = Post.find(params[:post_id])
    @topic = Topic.find(@post.commentable_id)
    @post.destroy

    respond_to do |format|
      format.html { redirect_to topic_path(@topic), notice: 'Post was deleted' }
      format.json { rhead :no_content }
    end
  end

  def destroy
    @university = @topic.university
    @topic.destroy
    
    respond_to do |format|
      format.html { redirect_to discussion_university_path(@university), notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
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
