class Api::V1::Events::MedalistsController < ApplicationController
  before_action :set_event, only: :show
  def show
    render json: EventMedalistsSerializer.present_medalists(@event)
  end

  private

  def set_event
    @event = Event.find_by(id: params['id'])
    head :not_found unless @event
  end
end
