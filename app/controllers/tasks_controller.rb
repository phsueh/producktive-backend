class TasksController < ApplicationController
    before_action :authorized, only:[:create]
    before_action :find_task, only:[:update]

    def create
        task = @user.tasks.create(task_params)
        render json: task
    end

    def index
        tasks = Task.all
        render json: tasks
    end

    def update
        @task.update(task_params)
        render json: @task
    end

    private 
    def task_params
        params.permit(:name, :description, :priority, :difficulty, :start_date, :end_date, :status_complete, :duration, :taskable_type, :taskable_id)
    end

    def find_task
        @task = Task.find(params[:id])
    end
end
