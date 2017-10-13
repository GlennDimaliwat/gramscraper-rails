class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :instagram_photo_id
      t.string :standard_resolution
      t.string :low_resolution
      t.string :thumbnail
      t.text :caption

      t.timestamps
    end
  end
end
