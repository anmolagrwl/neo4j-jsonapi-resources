class ContactsController < ApplicationController

  def index
    @contacts = Contact.first
    # binding.pry
    @result = JSONAPI::ResourceSerializer.new(ContactResource).serialize_to_hash(ContactResource.new(@contacts, nil))
    render json: @result
  end

  def show
    @id = params[:id]
    @result = Contact.find_by_id(@id)
    render json: @result
  end

  def get_related_resources
    binding.pry
  end

end
