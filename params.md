Started PATCH "/posts/1" for 127.0.0.1 at 2015-07-28 15:05:02 -0700
Processing by PostsController#update as HTML
Parameters: { 
"utf8"=>"✓",
"authenticity_token"=>"+8liMahjMiyA0WFF8ef8wzXu72+xXIKxlYzuI5UcTC4=",
"post"=>{
"title"=>"My Super Title", 
"body"=>"Some Body of a post", 
"tag_ids"=>["", "2", "3", "5"] }, 
"commit"=>"Update Post", 
"id"=>"1" 
}

### Raw HTML for above server output

<form action="/posts/1" method="post">
  <input name="utf8" type="hidden" value="✓">
  <input name="authenticity_token" type="hidden"
    value="<%= form_authenticity_token %>">
</form>
