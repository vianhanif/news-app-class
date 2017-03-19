class PagesController < ApplicationController
  before_action :set_articles_and_videos, only: [:news, :videos]
  before_action :set_article, only: [:read_article]
  before_action :set_video, only: [:watch]
  before_action :set_agendas, only: [:agendas]
  before_action :set_agenda, only: [:read_agenda]

  def index
    @picked_articles = Article.where("pick = ? and published <= ?", "True", Date.today).all
    @articles = Article.where("published <= ?", Date.today).all.paginate(page: params[:page], per_page: 6)
    @videos = Video.last(10)
    content_for :title, "News and Videos"
  end

  def search
    if params[:search]
      unless params[:search].empty?
        @articles_by_tag = Article.tagged_with(params[:search])
        @articles_by_title = Article.search params[:search]
        @videos_by_title = Video.search params[:search]
        @agendas_by_title = Agenda.search params[:search]
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

  def read_article
    content_for :title, @article.title
    content_for :og_title, @article.title
    content_for :og_image_url, @article.image.url
    content_for :og_desc, Sanitize.fragment(@article.content)
  end

  def watch
    content_for :title, @video.title
  end

  def agendas
    content_for :title, "Latest Agenda"
  end

  def read_agenda
    content_for :title, @agenda.title
    content_for :og_title, @agenda.title
    content_for :og_image_url, @agenda.image.url
    content_for :og_desc, Sanitize.fragment(@agenda.description)
  end

  private

    def set_articles_and_videos
      @articles = Article.where("published <= ?", Date.today).all.paginate(page: params[:page], per_page: 8)
      @videos = Video.all.paginate(page: params[:page], per_page: 6)
    end

    def set_article
      @article = Article.find(params[:slug])
    end

    def set_video
      @video = Video.find(params[:slug])
    end

    def set_agendas
      @agendas = Agenda.all.paginate(page: params[:page], per_page: 6)
    end

    def set_agenda
      @agenda = Agenda.find(params[:slug])
    end
end
