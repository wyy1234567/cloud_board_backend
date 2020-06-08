class Post < ApplicationRecord
    belongs_to :user
    belongs_to :area
    belongs_to :category
    has_many :comments
    has_many :images


    def detailed_post
        post = {}
        post = {:post => self}
        post.merge!({:user => self.user})
        post.merge!({:area => self.area})
        post.merge!({:category => self.category})
        # post.merge!({:comments => self.comments})
        post.merge!({:comments => self.detail_comment})
        post.merge!({:images => self.images})
        post
    end

    def self.local_posts(zipcode)
        area = Area.find_by(zipcode: zipcode)
        posts = []
        area.posts.map do |post|
            posts << post.detailed_post
        end
        posts
    end

    def detail_comment 
        comments = []
        self.comments.map do |comment|
            details = {}
            user = User.find(comment['user_id'])
            details = {:comment => comment}
            details.merge!({:user => user})
            comments << details
        end
        comments
    end



end


