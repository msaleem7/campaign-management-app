class CommentsController < ApplicationController

    before_action :find_commentable, only: [:index, :new,:create, :find_comment]
    before_action :find_comment, only: [:edit, :update, :destroy, :show]
    
    # def index
    #     @comments = @campaign.comments.all
    # end
    
    # def new
    #     @comment = @campaign.comments.new
    # end

    # def show
    # end
    

    def create
        @comment = Comment.new(comment_params)
        @comment.commentable_id = @commentable.id
        @comment.commentable_type = @commentable.class.name

        @comment.commented_id = current_user.id
        @comment.commented_type = current_user.type
        if @comment.save
          flash[:success] = "Object successfully created"
          @commentable.class.name=="Campaign"? (redirect_to campaign_path(@commentable)) 
          : (redirect_to campaign_topic_path(params[:campaign_id],@commentable))                
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    # def edit
    # end

    # def update
    #     if @comment.update(comment_params)
    #       flash[:success] = "Object was successfully updated"
    #       redirect_to @campaign
    #     else
    #       flash[:error] = "Something went wrong"
    #       render 'edit'
    #     end
    # end

    def destroy
        @comment = Comment.find(
        params[:id]
        )
        if @comment.destroy
            flash[:success] = 'Object was successfully deleted.'
            @commentable.class.name=="Campaign"? (redirect_to campaign_path(@commentable)) 
          : (redirect_to campaign_topic_path(params[:campaign_id],@commentable))
        else
            flash[:error] = 'Something went wrong'
            redirect_to comments_url
        end
    end

    
    
    def filter_commentable
        if params[:topic_id]
            return "Topic" 
        else
            return "Campaign"
        end
    end
    

    def find_commentable
        
        if filter_commentable == "Topic"
           return @commentable = Topic.find(params[:topic_id])

        else
           return @commentable = Campaign.find(params[:campaign_id])
        end
        
    end

    def find_comment
        @commentable = find_commentable
        @comment = @commentable.comments.find(params[:id]) 
    end

    
    
    private

    def comment_params
        params.require(:comment).permit(:title)
    end
end
