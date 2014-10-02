class ArticlesController < ApplicationController

  before_action :set_articles, :only=>[:show, :category]


  def show
    @article = Article.find(params[:id])
    @category = @article.category
    @author = @article.user


  end

  def category
    @category = params[:category]
    @category_articles = Article.where( :category => params[:category])
                       .order('created_at desc')
  end


  def create
    @article = Article.new ( article_params )
    if @article.save
      redirect_to article_path(@article)
    else
      render 'new.html.erb'
    end
  end



  def new
    if not is_signed_in?
      redirect to root_path
      flash[:notice] = "You must be logged in in order to create an article"
    end
    
    @article = Article.new
  end



  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path

  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render 'edit.html.erb'
    end
  end


  def index
    @category = nil
    @articles = Article.order('created_at desc').paginate(:page => params[:page], :per_page => 3)
  end

  def edit
    @article = Article.find(params[:id])
  end


  private
  def article_params
    params.require(:article).permit(:content,:title,:author,:category)
  end

  def set_articles
    @articles = Article.all.order('created_at desc').limit(5)
  end

end
