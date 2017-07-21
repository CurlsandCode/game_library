class Game < ApplicationRecord
  belongs_to :user
  has_many :screenshots
  validates :name, presence: true

  def screenshots_attributes=(screenshots_attributes)

  end

end
