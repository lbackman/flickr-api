class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new
    @photos = flickr.photos.search(user_id: '197629877@N03', per_page: 10).map { |photo| Flickr.url(photo) }
  end
end
