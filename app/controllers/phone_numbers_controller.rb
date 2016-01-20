class PhoneNumbersController < ApplicationController

  def index
    @phones = PhoneNumber.all.to_json
    render json: @phones
  end

end
