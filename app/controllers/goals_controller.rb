class GoalsController < ApplicationController

    before_action :authorized, only:[:create]
    before_action :find_goal, only:[:destroy]

    def create
        goal = Goal.create(goal_params)
        render json: goal
    end

    def destroy
        @goal.destroy
        render json: @goal
    end

    private

    def goal_params
        params.permit(:name, :start_date, :end_date, :category_id)
    end

    def find_goal
        @goal = Goal.find(params[:id])
    end

end
