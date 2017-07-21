class Screenshot < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :games
end
