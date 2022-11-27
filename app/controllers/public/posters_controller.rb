class Public::PostersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  private

  def poster_params
    params.require(:poster).permit(:name)
  end
end
