class PhoneNumbersController < ApplicationController

  def index
    @phones = PhoneNumber.first
    @result = JSONAPI::ResourceSerializer.new(PhoneNumberResource).serialize_to_hash(PhoneNumberResource.new(@phones, nil))
    render json: @result
  end

  def show
    @id = params[:id]
    @result = PhoneNumber.find_by_id(@id)
    render json: @result
  end

  def get_related_resources
    @source = params[:source].classify.constantize
    # @relationship = params[:relationship]
    @phones = @source.find_by_id(params[:contact_id]).phone_numbers
    # binding.pry
    render json: @phones
  end

  def show_relationship
    binding.pry
    @source = params[:controller].classify.constantize
    @relationships = @source.find_by_id(params[:phone_number_id]).rels
    render json: @relationships
    # binding.pry
  end

end
