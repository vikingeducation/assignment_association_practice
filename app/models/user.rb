class User < ApplicationRecord
	
	has_many :post_authorings, :class_name => "UserPost", :dependent => :destroy
	has_many :comments, foreign_key: :user_id, dependent: :destroy
	has_many :authored_posts, :through => "post_authorings", :class_name => 'Post', :source => :post
	
end
