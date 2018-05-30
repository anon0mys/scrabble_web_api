class Api::V1::Games::PlaysController < ApiController
  def create
    user_play = Play.new(play_params)
    user_play.save
    head 201
  end

  private

  def play_params
    params.permit(:user_id, :word, :game_id)
  end
end
