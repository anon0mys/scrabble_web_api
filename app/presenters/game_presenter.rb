class GamePresenter
  attr_reader :game

  def initialize(game)
    @game = game
    @player_1 = game.player_1
    @player_2 = game.player_2
  end

  def stats
    {
      game_id: game.id,
      scores: [
        {
          user_id: @player_1.id,
          score: game.score_plays(@player_1)
        },
        {
          user_id: @player_2.id,
          score: game.score_plays(@player_2)
        }
      ]
    }
  end
end
