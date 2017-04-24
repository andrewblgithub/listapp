class MembershipsController < ApplicationController
    def new
      @list = List.find params[:list_id]
      @membership = Membership.new({list: list})
    end

    def create
      @list = List.find params[:list_id]
      @membership = Membership.new(membership_params)
    end

    private
        def membership_params
            params.require(:membership).merge(list_id: params[:list_id], user_id: current_user.id)
        end
end