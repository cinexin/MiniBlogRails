class PostsController < ApplicationController

	def new
		@post = Post.new

		respond_to do |format|
			format.html #new.html.erb
			format.json {render :json => @post}
		end
	end

	def create
		@post = Post.new(post_params)
		

		respond_to do |format|
			if @post.save
				format.html {redirect_to @post}	
				format.json {render :json => @post, :status=>:created, :location=>@post}
			else
				format.html {render :action=>:new}				
				format.json {render :json=>@post.errors, :status=>:unprocessable_entity}

			end
		end
		
	end

	def show
		# note: Rails will pass all instance variables to the view
		@post = Post.find(params[:id])
		#@comment = @post.comments.find(params[:comment_id])
	end

	def index
		@posts = Post.all
		respond_to do |format|
			format.html #index.html.erb
			format.json {render :json=>@posts}
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id]) 
		if @post.update(params[:post].permit(:title, :text))
    		redirect_to @post
  		else
    		render 'edit'
  		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
 
		redirect_to posts_path
	end

	
	private
	def post_params
		params.require(:post).permit(:title,:text)
	end


end
