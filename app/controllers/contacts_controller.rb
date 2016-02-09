class ContactsController < ApplicationController
  def index

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
