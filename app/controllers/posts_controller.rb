class PostsController < ApplicationController
    
    def new
       @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id # assign post to user who created it
        respond_to do |f|
            if (@post.save)
                f.html { redirect_to "", notice: "Post created!" }
            else
                f.html { redirect_to "", notice: "Error: post not saved!" }
            end
        end
    end
    
    private
    def post_params # allows certain data to be passed via form
        params.require(:post).permit(:user_id, :content, :expires_at)
    end
end