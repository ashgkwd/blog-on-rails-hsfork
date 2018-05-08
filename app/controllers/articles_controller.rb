class ArticlesController < ApplicationController

	# http_basic_authenticate_with name: "kira", password: "hellokira", except: [:index, :show]
	before_action :authenticate_user!, except: [:index, :show, :api]
	# before_filter :authenticate_user!

	# , except: :index
	# after_action :verify_policy_scoped, only: :index

	def index
		@articles = Article.all
		# authorize @articles
	end
	
	def api
		@articles = Article.all
		# authorize @articles
		render :json => @articles
	end

	def show
		@article = Article.find(params[:id])
		# authorize @article		
	end

	def new
		@article = Article.new
		# authorize @article
	end
	
	def edit
		@article = Article.find(params[:id])
		# authorize @article
		
	end
	
	def create
		@article = Article.new(article_params)
		@article.user = current_user
		
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
		# authorize @article
	end

	def update
	  @article = Article.find(params[:id])
		
	  if @article.update(article_params)
	    redirect_to @article
	  else
	    render 'edit'
	  end
		# authorize @article		
	end

	def destroy
	  @article = Article.find(params[:id])
	  @article.destroy
	 
		redirect_to articles_path
		# authorize @article
	end

	private
	def article_params
		params.permit!
		params[:article]
		# params.require(:article).permit(:project, :languages, :description, :image)
	end
end
