class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id
        @comment.username = current_user.username
        @comment.save
        redirect_to :back
    end
    
    def show
    end
    
    def destroy  
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to ""
    end  
    
    private
        def comment_params
            params.require(:comment).permit(:user_id, :content, :username)
        end
end