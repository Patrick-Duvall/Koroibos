class Api::V1::OlympiansController < ApplicationController

  def index
    require "pry"; binding.pry
    olympian = Olympian.youngest if params['age'] == 'youngest'
    olympians = Olympian.all
    require "pry"; binding.pry
    render json: OlympianSerializer.new(olympians).present_olympians
  end
end
