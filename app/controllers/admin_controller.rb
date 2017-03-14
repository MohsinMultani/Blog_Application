class AdminController < ApplicationController
  def index
    @blogs = Blog.all
  end
end
