class Api::V1::Events::MedalistsController < ApplicationController
  def show
    event = Event.find(params['id'])
    medalists = event.medalists.map do |medalist|
      {
        name: medalist.name,
        age: medalist.age,
        team: medalist.team,
        medal: medalist.medal,
      }
    end
    response = {
      event: event.name,
      medalists: event.medalists
    }
    require "pry"; binding.pry
    render json: response
  end
end
