class ContactsController < ApplicationController

  def index
    @contacts = Contact.first
    # binding.pry
    @result = JSONAPI::ResourceSerializer.new(ContactResource).serialize_to_hash(ContactResource.new(@contacts, nil))
    render json: @result
  end

end
