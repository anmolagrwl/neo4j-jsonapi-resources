class PhoneNumbersController < ApplicationController

  def index
    @phones = PhoneNumber.all
    render json: @phones
  end

  def get_related_resources
    @source = Object.const_get(params[:source].singularize.capitalize)
    # @relationship = params[:relationship]
    @phones = @source.find_by_id(params[:contact_id]).phone_numbers
    # binding.pry
    render json: @phones
  end

end
