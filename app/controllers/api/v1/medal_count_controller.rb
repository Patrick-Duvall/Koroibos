class Api::V1::MedalCountController < ApplicationController
  def index
    render json: MedalCountSerializer.present_medals
  end
end
