class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
    content_for :title, "Videos"
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    content_for :title, @video.title
  end

  # GET /videos/new
  def new
    @video = Video.new
    content_for :title, "New Video"
  end

  # GET /videos/1/edit
  def edit
    content_for :title, "Edit \"#{@video.title}\""
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    if !@video.url.empty?
      url = VideoInfo.new @video.url
      @video.image = url.thumbnail_small
    end
    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:url, :title, :image)
    end
end
