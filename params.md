Write the raw HTML which produces the following server output:

```
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
```

(labels removed)

```
  <form accept-charset="UTF-8" action="/posts/1" class="edit_post" id="edit_post_1" method="post">
    <input name="utf8" type="hidden" value="✓">
    <input type="hidden" name="authenticity_token" value="+8liMahjMiyA0WFF8ef8wzXu72+xXIKxlYzuI5UcTC4=">

    <input type="text" name="post[title]">
    <textarea name="post[body]"></textarea>

    <input checked="unchecked" id="post_tag_ids_1" name="post[tag_ids][]" type="checkbox" value="1">

    <input checked="checked" id="post_tag_ids_2" name="post[tag_ids][]" type="checkbox" value="2">

    <input checked="checked" id="post_tag_ids_3" name="post[tag_ids][]" type="checkbox" value="3">

    <input checked="checked" id="post_tag_ids_5" name="post[tag_ids][]" type="checkbox" value="5">

    <input type="submit" name="commit" value="Update Post">
  </form>
```