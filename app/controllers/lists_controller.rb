class ListsController < ApplicationController

    before_action :set_new_list

    def index
    end

    def show
        @list=List.find(params[:id])
    end
    
    def new
    end
    
    def create
        @list = List.new(list_params)
        @list.user_id = current_user.id
        @list.save
        redirect_to ""
    end
    
    private
        def list_params # allows certain data to be passed via form
            params.require(:list).permit(:user_id, :name)
        end
        
        def set_new_list
            @newList = List.new
            @lists = List.all
        end

end