### WHAT WE NEED TO OUTPUT

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

### HTML

<form accept-charset="UTF-8" action="/posts/1" class="edit_post" id="edit_post_1" method="POST">
  <input name="utf8" type="hidden" value="✓">
  <input name="authenticity_token" value="+8liMahjMiyA0WFF8ef8wzXu72+xXIKxlYzuI5UcTC4=" type="hidden">
  <input type="text" name="post[title]" value="My Super Title">
  <textarea name="post[body]">Some Body of a post</textarea>
  <input name="post[tag_ids][]" type="hidden" value="">
  <label>footag1
    <input name="post[tag_ids][]" type="checkbox" value="1">
  </label>
  <label>footag2
    <input checked="checked" name="post[tag_ids][]" type="checkbox" value="2">
  </label>
  <label>footag3
    <input checked="checked" name="post[tag_ids][]" type="checkbox" value="3">
  </label>
  <label>footag4
    <input name="post[tag_ids][]" type="checkbox" value="4">
  </label>
  <label>footag5
    <input checked="checked" name="post[tag_ids][]" type="checkbox" value="5">
  </label>
  <input type="submit" value="Update">
</form>