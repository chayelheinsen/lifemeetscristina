# frozen_string_literal: true

class PostsController < ApplicationController
  impressionist actions: %i[show]

  def index
    @posts = Post.published.sorted
    @categories = Category.sorted
    @show_search = 1
  end

  def show
    @post = Post.find(params[:id])
  end
end
