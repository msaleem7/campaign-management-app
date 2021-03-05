class CampaignsController < ApplicationController
    def index
        @campaigns = Campaign.all
    end
    
    def new
        
        authorize @campaign = Campaign.new

    end

    def show
        @campaign = Campaign.find(params[:id])
    end
    

    def create
        @campaign = Campaign.new(campaign_params)
        authorize @campaign
        @campaign.user_id = current_user.id
        if @campaign.save
          flash[:success] = "Object successfully created"
          redirect_to @campaign
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def edit
        authorize @campaign = Campaign.find(params[:id])
    end

    def update
        authorize @campaign = Campaign.find(params[:id])
        if @campaign.update(campaign_params)
          flash[:success] = "Object was successfully updated"
          redirect_to @campaign
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def destroy
        authorize @campaign = Campaign.find(params[:id])
        if @campaign.destroy
            flash[:success] = 'Object was successfully deleted.'
            redirect_to campaigns_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to campaigns_url
        end
    end

    private
        def campaign_params
        params.require(:campaign).permit(:title,:purpose,:estimated_duration)
        end

end
