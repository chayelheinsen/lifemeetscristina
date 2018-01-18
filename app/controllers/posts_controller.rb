# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.published.sorted
    @categories = Category.sorted
  end

  def show
    @post = Post.find(params[:id])
  end
end
