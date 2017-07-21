class AddAttachmentPictureToScreenshots < ActiveRecord::Migration
  def self.up
    change_table :screenshots do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :screenshots, :picture
  end
end
