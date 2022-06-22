class ContactsController < ApplicationController
  def index
    if params[:group_id] && !params[:group_id].empty?
      @contacts = Contact.where(group_id: params[:group_id]).page(params[:page])
    else
      @contacts = Contact.order('created_at DESC').page(params[:page])
    end
    @groups = Group.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "Contact created successfully."
      redirect_to contacts_path
    else
      render :new
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:group_id, :name, :email, :company, :phone, :address)
  end
end
