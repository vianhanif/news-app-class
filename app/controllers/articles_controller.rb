class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :pick]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all.paginate(page: params[:page], per_page: 20)
    content_for :title, "Articles"
  end

  def pick
    @article.pick = !@article.pick
    if @article.save
      respond_to do |format|
        format.html { redirect_to articles_path, notice: 'Article was successfully updated.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to articles_path, notice: 'Article update failed.' }
      end
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    content_for :title, @article.title
  end

  # GET /articles/new
  def new
    @article = Article.new
    content_for :title, "New Article"
  end

  # GET /articles/1/edit
  def edit
    content_for :title, "Edit \"#{@article.title}\""
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:pick, :author, :title, :image, :headline, :published, :content, :category_id, :tag_list)
    end
end
