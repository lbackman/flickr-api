class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new
    @user_id = params[:user_id]
    if @user_id
      begin
        @photos = flickr.photos.search(user_id: @user_id, per_page: 10).map { |photo| Flickr.url(photo) }
      rescue Flickr::FailedResponse => e
        @error = "Unknown user id: #{@user_id}"
      end
    end
  end
end
