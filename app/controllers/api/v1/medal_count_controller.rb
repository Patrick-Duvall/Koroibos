class Api::V1::MedalCountController < ApplicationController
  def index
    require "pry"; binding.pry
    MedalCountSerializer.present_medals
    render json: {}
  end
end
