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
  <input name="_method" type="hidden" value="patch" />
  <input name="utf8" type="hidden" value="✓">
  <input name="authenticity_token" type="hidden"
    value="+8liMahjMiyA0WFF8ef8wzXu72+xXIKxlYzuI5UcTC4=">
    <label for="username">
    <input type="text" name="post[title]" id="username" value="My Super Title">
    <label for="body">
    <input type="text" name="post[body]" id="body" value="Some Body of a post">

      <label for="post_tag_ids_1">1</label>
      <input type="checkbox" checked="checked" id="post_tag_ids_1" name="post[tag_ids][]"  value="">

      <label for="post_tag_ids_2">2</label>
      <input type="checkbox" checked="checked" id="post_tag_ids_2" name="post[tag_ids][]" value="2">

      <label for="post_tag_ids_3">3</label>
      <input type="checkbox" checked="checked" id="post_tag_ids_3" name="post[tag_ids][]" value="3">

      <label for="post_tag_ids_5">5</label>

      <input type="checkbox" checked="checked" id="post_tag_ids_5" name="post[tag_ids][]" value="5">
      <input type="submit" name="commit" value="Update Post">
</form>
