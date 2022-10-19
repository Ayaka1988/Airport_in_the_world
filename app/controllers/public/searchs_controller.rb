class Public::SearchsController < ApplicationController
  before_action :authenticate_user!

  def search
    @posts = Post.search(params[:keyword])
    @posts = Post.where(airport_name: params[:airport_name])
  end


end