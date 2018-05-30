class Game < ApplicationRecord
  belongs_to :player_1, class_name: "User", foreign_key: :player_1_id
  belongs_to :player_2, class_name: "User", foreign_key: :player_2_id

  has_many :plays

  def score_plays(player)
    plays.where(user_id: player.id).sum(:score)
  end
end
