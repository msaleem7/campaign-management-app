class TodosController < ApplicationController

    before_action :find_campaign, only: [:index, :new, :create, :find_todo]
    before_action :find_todo, only: [:edit, :update, :show,:destroy]
    
    def index
        @todos = @campaign.todos.all
    end
    
    def new
        @todo = @campaign.todos.new
    end

    def show
    end
    

    def create
        
        
        @todo = @campaign.todos.new(todo_params)
        authorize @todo
        if @todo.save
          flash[:success] = "Object successfully created"
          redirect_to campaign_path(@campaign)
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def edit
        authorize @todo
    end

    def update
        authorize @todo
        if @todo.update(todo_params)
          flash[:success] = "Object was successfully updated"
          redirect_to @campaign
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def destroy
        authorize @todo
        if @todo.destroy
            flash[:success] = 'Object was successfully deleted.'
            redirect_to @campaign
        else
            flash[:error] = 'Something went wrong'
            redirect_to todos_url
        end
    end

    def find_campaign
        @campaign = Campaign.find(params[:campaign_id])      
    end
    
    def find_todo
        @campaign = Campaign.find(params[:campaign_id])
        @todo = @campaign.todos.find(params[:id]) 
    end

    private

    def todo_params
        params.require(:todo).permit(:description,:completed,:campaign_id)
    end
end
