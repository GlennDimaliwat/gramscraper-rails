class LandingController < ApplicationController
  def index
    @instagram_username = ENV.fetch("INSTAGRAM_USERNAME")
    @photos = Photo.all
  end

  def create
    instagram_username = ENV.fetch("INSTAGRAM_USERNAME")
    photos = Gramscraper.scrape(instagram_username)
    @instagram_data = Array.new
    photos.each do |photo|
        instagram_photo_id = photo[:last_id]
        image_standard_res = photo[:standard_resolution]
        image_low_res = photo[:low_resolution]
        image_thumbnail = photo[:thumbnail]
        image_caption = photo[:caption]

        existing_photo = Photo.where(instagram_photo_id: instagram_photo_id).first
# byebug
        if !existing_photo
            @instagram_data << {
                :instagram_photo_id => instagram_photo_id,
                :standard_resolution => image_standard_res,
                :low_resolution => image_low_res,
                :thumbnail => image_thumbnail,
                :caption => image_caption,
            }
        end
    end

    Photo.create(@instagram_data)

    @photos = Photo.all
    render :index
  end
end
