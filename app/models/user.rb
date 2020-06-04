class User < ApplicationRecord
    has_many :comments
    has_many :posts
    has_secure_password
    
    validates :name, uniqueness: { case_sensitive: false }
end
