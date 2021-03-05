class TopicsController < ApplicationController


    before_action :find_campaign, only: [:index, :new,:create, :find_topic]
    before_action :find_topic, only: [:edit, :update, :show,:destroy]
    
    def index
        @topics = @campaign.topics.all
    end
    
    def new
        @topic = @campaign.topics.new
    end

    def show
    end
    

    def create 
        @topic = @campaign.topics.new(topic_params)
        authorize @topic
        @topic.topic_creator = current_user
        if @topic.save
          flash[:success] = "Object successfully created"
          redirect_to campaign_topics_path(@campaign)
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def edit
        authorize @topic
    end

    def update
        authorize @topic
        if @topic.update(topic_params)
          flash[:success] = "Object was successfully updated"
          redirect_to campaign_topic_path(@campaign,@topic)
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def destroy
        authorize @topic
        if @topic.destroy
            flash[:success] = 'Object was successfully deleted.'
            redirect_to campaign_topics_path(@campaign)
        else
            flash[:error] = 'Something went wrong'
            redirect_to campaign_topics_path(@campaign)
        end
    end

    def find_campaign
        @campaign = Campaign.find(params[:campaign_id])      
    end
    
    def find_topic
        @campaign = Campaign.find(params[:campaign_id])
        @topic = @campaign.topics.find(params[:id]) 
    end

    private

    def topic_params
        params.require(:topic).permit(:title)
    end
end
