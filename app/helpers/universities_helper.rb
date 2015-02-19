module UniversitiesHelper

  def total_post_count(topic)
    post_ids = topic.posts.map(&:id)
    Post.where(commentable_id: topic.id, commentable_type: "Topic").count +
    Post.where(commentable_id: post_ids, commentable_type: "Post").count
  end
end
