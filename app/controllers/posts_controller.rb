class PostsController < ApplicationController
    
    before_action :set_new_post
    
    def index
        @posts = Post.all
    end
        
    def show
        @post=Post.find(params[:id])
    end
    
    def edit
        @post=Post.find(params[:id])
    end
    
    def new
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id # assign post to user who created it
        @post.save
        redirect to :back
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to :back
    end
    
    def like
        @post = Post.find(params[:id])
        @post.liked_by current_user
        redirect_to :back
    end
    
    def unlike
        @post = Post.find(params[:id])
        @post.unliked_by current_user
        redirect_to :back
    end
    
    private
    def post_params # allows certain data to be passed via form
        params.require(:post).permit(:user_id, :content, :expires_at)
    end
    
    def set_new_post
        @newPost = Post.new
    end
    
end