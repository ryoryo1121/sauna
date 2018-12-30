class ArticlesController < ApplicationController


  def index
    @articles = Article.visible.order(released_at: :desc)
    @articles = @articles.open_to_the_public unless current_member
    @articles = @articles.page(params[:page]).per(5)
  end



  def show
    articles = Article.visible
    articles = article.open_to_the_public unless current_member
    @article = Article.find(params[:id])
  end
end
