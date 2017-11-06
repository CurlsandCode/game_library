class Screenshot < ApplicationRecord
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  belongs_to :game


  def next
    ordered = scoped.order("created_at asc")
    ordered.first(:conditions => ["created_at > ?", img.created_at]) || ordered.first
  end

  # def self.previous(screenshot)
  #   where('id > ?', screenshot.id).first
  # end

end
