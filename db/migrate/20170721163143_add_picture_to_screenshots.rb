class AddPictureToScreenshots < ActiveRecord::Migration[5.0]
  def change
    add_column :screenshots, :picture, :string
  end
end
