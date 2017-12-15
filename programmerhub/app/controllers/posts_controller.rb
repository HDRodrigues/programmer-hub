class PostsController < ApplicationController
	load_and_authorize_resource
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@user = current_user 
		@post = Post.new
		# array de posts sem associacao por isso o map
    posts = current_user.posts.map {|post| post}
    #pega todos os seguidores 
      #para todos os posts do seguidor
        #pega os posts
    current_user.all_following.each do |user| 
      user.posts.each do |post| 
				posts << post
		@posts = posts.sort_by &:created_at
	end

	def create
		@post = Post.new(post_params)
		respond_to do |format|
			if @post.save
				format.json { render json: @post, status: :created }
				format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
			else
				format.json { render json: @post.errors, status: :unprocessable_entity }
				format.html { redirect_to posts_path }
			end
		end
	end

	def show
		@comment = Comment.new
		@comments = @post.comments
	end

	def destroy
		@post.destroy

		respond_to do |format|
			format.json { head :no_content }
			format.html { redirect_to posts_path, notice: 'Post was successfully destroyed.' }
		end
	end

	def edit
	end

	def update
	end

	private

		def set_post
			@post = Post.find(params[:id])
		end

		def post_params
			params.require(:post).permit(:body).merge(user: current_user)
		end
end
