# ----------------------------------------
# Dependent Management
# ----------------------------------------

$num = 0
def problem(str)
  puts '*' * 10
  puts
  puts "#{$num += 1}. #{str}"
  puts
  puts '*' * 10
  2.times { puts }
end


problem("Destroying a user should also destroy all of the comments that user authored")
User.first.destroy

problem("Destroying a comment should NOT destroy its author or its parent post.")
Comment.first.destroy

problem("Destroying a post should destroy all comments on it.")
Post.first.destroy

problem(%Q;Destroying a post should NOT destroy all its authors,
  but it shouldn't leave any lines in the join table which still point to it
  (so, for instance, asking User.first.authored_post_ids should NOT return ids
  from posts that were destroyed and User.first.post_authorings should be empty);
)
Post.last.destroy

problem(%Q;Destroying a category should NOT destroy posts under it,
  and destroying a post should certainly not destroy its category;)
Category.first.destroy
Post.first.destroy

problem(%Q;Same for authors -- destroying a user should NOT
  destroy all the posts they wrote
  (there may be co-authors and the readers still want to read them!)
  but it should not continue to list that author among a given post's authors.;)
User.first.destroy

problem(%Q;Use the same logic to ensure that Tags and Posts do not
  leave any dangling foreign keys that point to non-existant objects.;)
Tag.first.destroy
Post.first.destroy









