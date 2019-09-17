class Api::V1::EventsController < ApplicationController
  def index
    render json: EventsSerializer.present_events
  end
end
