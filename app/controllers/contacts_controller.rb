class ContactsController < ApplicationController
  def index
    @contacts = Contact.page(params[:page])
    @groups = Group.all
  end
end
