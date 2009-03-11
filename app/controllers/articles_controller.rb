class ArticlesController < ApplicationController
  def show
    unless @article = Article.find_by_title(params[:id].humanize)
      render :file => "#{RAILS_ROOT}/public/404.html", :status => '404'
    end
  end
  
  def index
    @articles = Article.all
  end
end
