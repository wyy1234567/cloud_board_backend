class PostsController < ApplicationController
    def index
        render json: Post.all 
    end

    def show
        post = Post.find(params[:id])
        render json: post, except: [:created_at, :updated_at]
    end

    def create 
        post = Post.create(post_params)
        render json: post, except: [:created_at, :updated_at]
    end

    def update 
        post = Post.find(params[:id])
        post.update(post_params)
        render json: post, except: [:created_at, :updated_at]
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
    end

    private
    def post_params
        params.require(:post).permit!
    end
end
