class LandingController < ApplicationController
  def index
    @instagram_username = ENV.fetch("INSTAGRAM_USERNAME")

    @photos = Gramscraper.scrape(@instagram_username)
    
  end
end
