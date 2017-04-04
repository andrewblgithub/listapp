class CommentsController < ApplicationController
    
    before_action :set_post
    
    def new
        @comment = Comment.new
    end

    def create
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id
        @comment.username = current_user.username
        @comment.save
        redirect_to :back
    end
    
    def index
        @comments = @post.comments
        @newPost = Post.new
    end
    
    def show
        @comments = @post.comments
        @newPost = Post.new
    end
    
    def destroy  
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to :back
    end  
    
    private
        def comment_params
            params.require(:comment).permit(:user_id, :content, :username)
        end
        
        def set_post
            @post = Post.find(params[:post_id])
        end
end