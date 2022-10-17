class Public::SearchsController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @posts = Post.looks(params[:search], params[:word])
  end
end
