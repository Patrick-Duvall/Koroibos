class Api::V1::OlympianStatsController < ApplicationController
  def index
    render json: OlympianStatsSerializer.present_stats
  end
end
