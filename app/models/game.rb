class Game < ApplicationRecord
  belongs_to :user
  has_many :screenshots
  validates :name, presence: true

  def screenshots_attributes=(screenshots_attributes)
    screenshots_attributes.each do |screenshot_attribute|
      #create screenshot with these attributes
      self.screenshots.build(screenshot_attribute)
    end
  end

end
