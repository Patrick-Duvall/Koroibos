class Api::V1::MedalCountController < ApplicationController
  def index
    names = Olympian.select(:team).distinct.pluck(:team)
    response = names.map do |team_name|
      {
        name: team_name,
        medals: {
          gold: OlympianEvent.gold_count(team_name),
          silver: OlympianEvent.silver_count(team_name),
          bronze: OlympianEvent.bronze_count(team_name)
        }
      }
    end
    # MedalCountSerializer.present_medals
    render json: {countries: response}
  end
end
