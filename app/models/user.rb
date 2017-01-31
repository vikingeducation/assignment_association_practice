class User < ApplicationRecord
	has_many :authored_comments, class_name: "Comment" , foreign_key: :author_id, :dependent => :destroy
	has_many :post_authorings, foreign_key: :author_id, class_name: "Blogging", :dependent => :destroy
	has_many :authored_posts, :through => :post_authorings, :source => :post , foreign_key: :author_id
	has_many :tags_on_authored_posts, 
			 :through => :authored_posts,
			 :source  => :tags
end