class ContactsController < ApplicationController
  before_action :find_contact, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    session[:selected_group_id] = params[:group_id]
    @contacts = current_user.contacts.by_group(params[:group_id]).search(params[:term]).order(created_at: :desc).page(params[:page])
    @groups = Group.all
  end

  def autocomplete
    @contacts = current_user.contacts.search(params[:term]).order(created_at: :desc).page(params[:page])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
      flash[:success] = "Contact created successfully."
      redirect_to contacts_path
    else
      flash[:error] = "Contact couldn't be created."
      render :new
    end
  end

  def edit
    # Pundit Authorization
    authorize @contact
  end

  def update
    # Pundit Authorization
    authorize @contact

    if @contact.update(contact_params)
      flash[:success] = "Contact updated successfully."
      redirect_to contacts_path
    else
      flash[:error] = "Contact couldn't be updated."
      render :edit
    end
  end

  def destroy
    # Pundit Authorization
    authorize @contact
    
    @contact.destroy
    flash[:success] = "Contact deleted successfully."
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
