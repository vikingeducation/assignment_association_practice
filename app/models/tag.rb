class Tag < ApplicationRecord
  has_many :post_tags
  has_many :tagged_posts, :through => :post_tags,
                          :source => :tag,
                          :dependent => :nullify

  has_many :tags_on_authored_posts, :through => :post_tags,
                            :source => :post


  # allows you to do this Tag.first.post_taggings - renaming the join table and just saying what class it is
  has_many :post_taggings, :class_name => "PostTag"

  # return all the authors of posts a given 
  # tag has been associated with
  # Tag.first.authors_of_tagged_posts
  has_many :authors_of_tagged_posts, :through => :tags_on_authored_posts,
                                    :source => :post_authorings
end
