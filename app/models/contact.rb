class Contact < ActiveRecord::Base
  require 'csv'

  # Import data from CSV

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      contact_hash = row.to_hash
      contact = Contact.where(email: contact_hash["email"])

      # The following code will check if any email ID already exists and avoid duplicacy.

      if contact.count == 1
        contact.first.update_attributes(contact_hash)
      else
        Contact.create!(contact_hash)
      end
    end
  end

  # Search with last name or given character
  def self.search(search)
    if search
      self.where('lower(last_name) LIKE ? OR lower(email) LIKE ?', "#{search}%".downcase,"#{search}".downcase)
    else
      self.all
    end
  end



end
