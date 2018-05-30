class Api::V1::Games::PlaysController < ApiController
  def create
    presenter = WordSearchPresenter.new(params[:word])
    if presenter.valid_word?
      Play.create(play_params)
      head 201
    else
      render json: {"message": presenter.result}
    end
  end

  private

  def play_params
    params.permit(:user_id, :word, :game_id)
  end
end
