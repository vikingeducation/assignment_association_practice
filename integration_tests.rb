# 1
User.all
Comment.all
Post.all 
Category.all 
Tag.all 

# 2
User.all.sample.comments

# 3 
comment = User.first.comments.sample
User.last.comments << comment
