class Game < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :screenshots


  def screenshots_attributes=(screenshot_attributes)
    screenshot_attributes.each do |i, attributes|
      self.screenshots.build(attributes)
    end
  end

end
