class PostsController < ApplicationController
    #TODO:
    #1.show current user's posts
    #2.show current user's area's posts
    
    def index
        render json: Post.all 
    end

    def show
        post = Post.find(params[:id])
        post = post.detailed_post
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

    def user_posts 
        posts = []
        if current_user then
            current_user.posts.map do |post|
                posts << post.detailed_post
            end
        end
        render json: posts
    end

    def local_posts
        zip = params[:zipcode]
        local_posts = Post.local_posts(zip)
        render json: local_posts
    end

    private
    def post_params
        # params.require(:post).permit!
        params.permit!
    end
end
