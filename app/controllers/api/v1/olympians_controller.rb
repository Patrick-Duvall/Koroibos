class Api::V1::OlympiansController < ApplicationController

  def index
    olympians = Olympian.all
    render json: OlympianSerializer.new(olympians).present_olympians
  end
end
