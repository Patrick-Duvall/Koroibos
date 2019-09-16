class Api::V1::OlympiansController < ApplicationController

  def index
    olympians = [Olympian.youngest] if params['age'] == 'youngest'
    olympians = Olympian.all if !params['age']
    render json: OlympiansSerializer.new(olympians).present_olympians
  end
end
