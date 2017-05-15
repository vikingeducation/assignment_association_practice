
## RAW HTML
```
<form action="/posts/1" method="patch" accept-charset="utf-8">
  <input type="text" name="title">
  <textarea name="body"></textarea>

  <input type="hidden" name="post[tag_ids][]" value="">

  <label for="test_1">1</label>
  <input type="checkbox" name="post[tag_ids][]" value="1" id="test_1">

  <label for="test_2">2</label>
  <input type="checkbox" name="post[tag_ids][]" value="2" id="test_2" checked = "checked">

  <label for="test_3">3</label>
  <input type="checkbox" name="post[tag_ids][]" value="3" id="test_3" checked = "checked">

  <label for="test_4">4</label>
  <input type="checkbox" name="post[tag_ids][]" value="4" id="test_4">

  <label for="test_5">5</label>
  <input type="checkbox" name="post[tag_ids][]" value="5" id="test_5" checked = "checked">


  <input type="submit" name="commit" value="Update Post">

  <input type="hidden" name="authenticity_token" value=""+8liMahjMiyA0WFF8ef8wzXu72+xXIKxlYzuI5UcTC4="">
</form>
```




##SERVER OUTPUT:
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