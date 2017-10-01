class PostsController < ApplicationController
  def index
#declare instance variable @posts and assign it a collection of Post objects using all
    @posts = Post.all
#assignment for first and every fifth post after it with text SPAM
    @posts.each_with_index do |post, index|
      if index % 5 == 0
        post.title = "SPAM"
      end
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
