class Contact < ActiveRecord::Base
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      contact_hash = row.to_hash
      contact = Contact.where(email: contact_hash["email"])

      if contact.count == 1
        contact.first.update_attributes(contact_hash)
      else
        Contact.create!(contact_hash)
      end
    end
  end
end
