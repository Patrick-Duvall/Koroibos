class Api::V1::Events::MedalistsController < ApplicationController
  def show
    event = Event.find(params['id'])
    response = {
      event: event.name,
      medalists: event.medalists
    }
    require "pry"; binding.pry
    render json: response
  end
end
