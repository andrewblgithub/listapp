class PostsController < ApplicationController
    
    before_action :set_list

    def index
        @posts = @list.posts
        #@posts = Post.all
        #@posts = Post.filter(params.slice(:list))
        #respond_to do |format|
        #    format.html
        #    format.js
        #end
    end

    def show
        @post = @list.posts.find(params[:id])
    end
    
    def edit
        @post=@list.posts.find(params[:id])
    end
    
    def update
        @post=@list.posts.find(params[:id])
        @post.update(post_params)
        redirect_to :back
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = @list.posts.create(post_params)
        @post.user_id = current_user.id # assign post to user who created it
        @post.username = current_user.username
        @post.save
        redirect_to list_posts_path(@list)
    end
    
    def destroy
        @post=@list.posts.find(params[:id])
        @post.destroy
        redirect_to "/"
    end
    
    def like
        @post=@list.posts.find(params[:id])
        @post.liked_by current_user
        redirect_to :back
    end
    
    def unlike
        @post=@list.posts.find(params[:id])
        @post.unliked_by current_user
        redirect_to :back
    end
    
    private
    def post_params
        params.require(:post).permit(:user_id, :content, :description, :expires_at, :image)
    end
    
    def set_list
        @list=List.find(params[:list_id])
        @lists=current_user.lists
    end
    
end