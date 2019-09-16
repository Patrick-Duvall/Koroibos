class Api::V1::OlympiansController < ApplicationController

  def index
    olympians = Olympian.all
    require "pry"; binding.pry

    olympians_array = olympians.map{ |olympian|
      {
        name: olympian.name,
        age: olympian.age,
        team: olympian.team,
        sport: olympian.sport,
        total_medals_won: olympian.medal_count
      }
    }


    render json: {"olympians": olympians_array}
  end
end
