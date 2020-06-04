class CommentsController < ApplicationController
    def index
        render json: Comment.all 
    end

    def show
        comment = Comment.find(params[:id])
        render json: comment, except: [:created_at, :updated_at]
    end

    def create 
        comment = Comment.create(comment_params)
        render json: comment, except: [:created_at, :updated_at]
    end

    def update 
        comment = Comment.find(params[:id])
        comment.update(comment_params)
        render json: comment, except: [:created_at, :updated_at]
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
    end

    private
    def comment_params
        params.require(:comment).permit(:content, :post_id, :user_id)
    end
end