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

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      flash[:success] = "Contact updated successfully."
      redirect_to contacts_path
    else
      render :edit
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:danger] = "Contact deleted successfully."
    redirect_to contacts_path
  end

  private
  def contact_params
    params.require(:contact).permit(:group_id, :name, :email, :company, :phone, :address, :avatar)
  end
end
