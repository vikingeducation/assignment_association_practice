class User < ApplicationRecord

  # before_destroy :destroy_callback

  has_many :authored_comments,
           :class_name => "Comment", 
           :foreign_key => :user_id,
           :dependent => :destroy

  has_many :post_authorings,
           :class_name => "PostUser",
           :foreign_key => :user_id,
           :dependent => :destroy
  
  has_many :authored_posts,
           :through => :post_authorings,
           :foreign_key => :user_id,
           :source => :post

  has_many :tags_on_authored_posts,
           :through => :authored_posts,
           :source => :tags

  private

  # def destroy_callback
  #   post_authorings.each do |p_authoring|
  #     p_authoring.user_id = nil
  #   end
  # end

end
