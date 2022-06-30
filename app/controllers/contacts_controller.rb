class ContactsController < ApplicationController
  before_action :find_contact, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    session[:selected_group_id] = params[:group_id]
    @contacts = Contact.by_group(params[:group_id]).search(params[:term]).order(created_at: :desc).page(params[:page])
    @groups = Group.all
  end

  def autocomplete
    @contacts = Contact.search(params[:term]).order(created_at: :desc).page(params[:page])
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
  end

  def update
    if @contact.update(contact_params)
      flash[:success] = "Contact updated successfully."
      redirect_to contacts_path
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    flash[:danger] = "Contact deleted successfully."
    redirect_to contacts_path
  end

  private
  def contact_params
    params.require(:contact).permit(:group_id, :name, :email, :company, :phone, :address, :avatar)
  end

  def find_contact
    @contact = Contact.find(params[:id])
  end
end
