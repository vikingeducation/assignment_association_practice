class PostUser < ApplicationRecord
  belongs_to :author,
             :class_name => "User",
             :foreign_key => :user_id,
             :optional => :true

  belongs_to :post
end
