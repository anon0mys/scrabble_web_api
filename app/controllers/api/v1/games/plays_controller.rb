class Api::V1::Games::PlaysController < ApiController
  def create
    render status: 201, json: {}
  end
end
