class Screenshot < ApplicationRecord
  has_attached_file :picture, styles: {medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  belongs_to :game


  def avatar_url
      picture.url
    end

  # def self.previous(screenshot)
  #   where('id > ?', screenshot.id).first
  # end

end
