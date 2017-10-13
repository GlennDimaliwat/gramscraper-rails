class AddIndexToPhotosInstagramPhotoId < ActiveRecord::Migration[5.1]
  def change
    add_index :photos, :instagram_photo_id
  end
end
