module VideosHelper

  def open_video video
    "watch/#{video.slug}"
  end

end
