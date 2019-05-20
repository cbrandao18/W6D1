class GoalsController < ApplicationController
    before_action :require_login

    def index
        @goals = current_user.goals
        render :index
    end

    def show
        @goal = Goal.find(params[:id])
        render :show
    end
    
    def new
        @goal = Goal.new
        render :new
    end

    def edit
        @goal = Goal.find(params[:id])
        render :edit
    end

    def create
        @goal = current_user.goals.new(goal_params)
        if @goal.save
            flash[:notice] = "Your goal was created"
            redirect_to goal_url(@goal)
        else
            flash.now[:errors] = @goal.errors.full_messages
            render :new
        end
    end

    def update
        @goal = Goal.find(params[:id])
        if @goal.update_attributes(goal_params)
            flash[:notice] = "Your goal was updated"
            redirect_to goal_url(@goal)
        else
            flash.now[:errors] = @goal.errors.full_messages
            redirect_to goals_url
        end
    end

    def destroy
        @goal = Goal.find(params[:id])
        @goal.destroy
        redirect_to goals_url
    end

    def goal_params
        params.require(:goal).permit(:title, :body, :completed, :public)
    end
end