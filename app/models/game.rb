class Game < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :screenshots
  accepts_nested_attributes_for :screenshots, \
  :reject_if => proc {|attributes| attributes['filename'].blank? \
  && attributes['filename_cache'].blank?}

  # def screenshots_attributes=(screenshot_attributes)
  #   binding.pry
  #   screenshot_attributes.each do |i, attributes|
  #     self.screenshots.build(attributes)
  #     binding.pry
  #   end
  # end

end
