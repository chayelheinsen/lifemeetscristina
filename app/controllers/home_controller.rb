# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @posts = Post.featured
  end
end
