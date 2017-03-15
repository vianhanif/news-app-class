class PagesController < ApplicationController
  before_action :set_articles_and_videos, only: [:news, :videos]
  before_action :set_article, only: [:read]
  before_action :set_video, only: [:watch]

  def index
    @picked_articles = Article.where(pick: true).all
    @articles = Article.all.paginate(page: params[:page], per_page: 6)
    @videos = Video.all
    content_for :title, "News and Videos"
  end

  def search
    if params[:search]
      unless params[:search].empty?
        @articles_by_tag = Article.tagged_with(params[:search])
        @articles_by_title = Article.search params[:search]
        @videos_by_title = Video.search params[:search]
        @search = true
      else
        redirect_to root_path
      end
      content_for :title, "Search for \"#{params[:search]}\""
    else
      redirect_to root_path
    end
  end

  def news
    content_for :title, "Latest News"
  end

  def videos
    content_for :title, "Latest Videos"
  end

  def read
    content_for :title, @article.title
  end

  def watch
    content_for :title, @video.title
  end

  private

    def set_articles_and_videos
      @articles = Article.all.paginate(page: params[:page], per_page: 20)
      @videos = Video.all.paginate(page: params[:page], per_page: 20)
      @search = false
    end

    def set_article
      @article = Article.find(params[:slug])
    end

    def set_video
      @video = Video.find(params[:slug])
    end
end
