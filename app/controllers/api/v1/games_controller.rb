class Api::V1::GamesController < ApiController
  def show
    game = Game.find(params[:id])
    presenter = GamePresenter.new(game)
    render json: presenter.stats
  end
end
