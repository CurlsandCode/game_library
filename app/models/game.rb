class Game < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  def genres=(genres)

  end
end
