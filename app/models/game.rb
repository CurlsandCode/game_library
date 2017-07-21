class Game < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :screenshots


  def screenshots_attributes=(screenshot_attributes)
    screenshot_attributes.each do |i, attributes|
      binding.pry
      self.screenshots.build(attributes)
      binding.pry
    end
  end

end
