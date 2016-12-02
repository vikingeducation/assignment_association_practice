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

<form action="/posts/1" method="patch" accept-charset="UTF-8">
  <input type="text" name="post[title]" value="My Super Title">
  <input type="text" name="post[body]" value="My Body of a post">

  <input type="checkbox" name="post[tag_ids][]" value="2">
  <input type="checkbox" name="post[tag_ids][]" value="3">
  <input type="checkbox" name="post[tag_ids][]" value="5">
  <input type="hidden" name="post[tag_ids][]" value="">


  <input type="hidden" name="authenticity_token" value="<%=form_authenticity_token%>">

  <input type="submit" name="commit" value="Post">
</form>
