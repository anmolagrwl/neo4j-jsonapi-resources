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

  def get_related_resource
    binding.pry
    @source = params[:source].classify.constantize
    # @relationship = params[:relationship]
    @contact = @source.find_by_id(params[:phone_number_id]).contact
    # binding.pry
    render json: @contact
  end

  def show_relationship
    # binding.pry
    @source = params[:controller].classify.constantize
    @relationships = @source.find_by_id(params[:contact_id]).rels
    render json: @relationships
    # binding.pry
  end

end
