class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :validate_user, only: [:show, :edit, :update, :destroy]
  def index
    @article = current_user.articles.order(created_at: :desc)
  end

  def show
  end


  def new
    @article = Article.new
  end

  def edit
    # @article = Article.edit
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to @article, notice: "作成できました"
    else
      flash.now[:alert] = "作成できませんでした"
      render action: :new
    end
  end

  def update  
    if @article.update(article_params)
      redirect_to @article, notice: "更新できました"
    else
      flash.now[:alert] = "更新できませんでした"
      render action: :edit
    end
  end

  def destroy  
    if @article.destroy
      redirect_to root_path, notice: "削除が完了しました"
    else
      flash.now[:alert] = "削除できませんでした"
      redirect_to root_path
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :body, :image)
  end

  def validate_user
    if @article.user != current_user
      redirect_to root_path, alert: '他ユーザーの投稿です'
    end
  end
end
