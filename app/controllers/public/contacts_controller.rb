class Public::ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact, current_user).deliver
      redirect_to posts_path, notice: 'Take off'
    else
      render :new
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :content)
    end

end
