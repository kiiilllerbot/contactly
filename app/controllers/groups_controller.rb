class GroupsController < ApplicationController
    before_action :authenticate_user!
    def create
        #render json: "Groups#create in Action."
        #@group = Group.new(group_params)
        @group = current_user.groups.build(group_params)
        if @group.save
            render json: @group, status: :created
        else
            render json: @group.errors.full_messages, status: :unprocessable_entity
        end
    end

    private
    def group_params
        params.require(:group).permit(:name)
    end
end
