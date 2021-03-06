class ListsController < ApplicationController
    
    before_action :set_new_list

    def index
    end

    def show
        @list=@lists.find(params[:id])
    end
    
    def new
    end
    
    def create
        @list = List.new(list_params)
        @list.user_id = current_user.id
        @list.users << current_user
        @list.save
        redirect_to ""
    end
    
    def edit
        @list = List.find(params[:id])
    end
    
    def update
        @list = @lists.find(params[:id])
        @list.update(list_params)
        redirect_to :back
    end
    
    def destroy
        @list = @lists.find(params[:id])
        @list.destroy
        redirect_to "/"
    end
    
    private
        def list_params # allows certain data to be passed via form
            params.require(:list).permit(:user_id, :name)
        end
        
        def set_new_list
            @newList = List.new
            @lists = current_user.lists
        end

end