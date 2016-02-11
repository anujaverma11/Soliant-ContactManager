class ContactsController < ApplicationController
  def index
    if (params[:last_name]!=nil)
      @contacts = Contact.search(params[:last_name])
    elsif(params[:email]!=nil)
      @contacts = Contact.search(params[:email])
    else
      @contacts = Contact.all
    end
  end

  def import
    begin
      Contact.import(params[:file])
      redirect_to root_url, notice: "Contacts imported."
    rescue
      redirect_to root_url, notice: "Invalid CSV file format."
    end
  end
end
