class Post < ApplicationRecord
    belongs_to :user
    belongs_to :area
    belongs_to :category
    has_many :comments
    has_many :images
end
