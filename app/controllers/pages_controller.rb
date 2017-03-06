class PagesController < ApplicationController
  before_action :set_articles_and_videos, only: [:news, :videos]
  before_action :set_article, only: [:read]

  def index
    @picked_articles = Article.where(pick: true).all
    @articles = Article.all.paginate(page: params[:page], per_page: 6, total_entries: 30)
    @videos = Video.all
    content_for :title, "News and Videos"
  end

  def search
    if params[:search]
      unless params[:search].empty?
        @articles_by_tag = Article.tagged_with(params[:search])
        @articles_by_title = Article.search params[:search]
        @videos_by_title = Video.search params[:search]
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
    content_for :title, @article
  end

  private

    def set_articles_and_videos
      @articles = Article.all.paginate(page: params[:page], per_page: 20)
      @videos = Video.all.paginate(page: params[:page], per_page: 20)
    end

    def set_article
      @article = Article.friendly.find(params[:id])
    end
end
