```html
<form action="/posts/1" method="patch">
  <input type="hidden" name="utf-8" value="✓">
  <input type="hidden" name="authenticity_token" value="+8liMahjMiyA0WFF8ef8wzXu72+xXIKxlYzuI5UcTC4=">

  <input type="text" name="post[title]" value="My Super Title">
  <input type="text" name="post[body]" value="Some Body of a post">

  <input type="hidden" id="post_tag_ids_0" name="post[tag_ids][]" value="">

  <label for="post_tag_ids_1">footag1</label>
  <input type="checkbox" id="post_tag_ids_1" name="post[tag_ids][]" value="1">

  <label for="post_tag_ids_2">footag2</label>
  <input type="checkbox" checked="checked" id="post_tag_ids_2" name="post[tag_ids][]" value="2">

  <label for="post_tag_ids_3">footag3</label>
  <input type="checkbox" checked="checked" id="post_tag_ids_3" name="post[tag_ids][]" value="3">

  <label for="post_tag_ids_4">footag4</label>
  <input type="checkbox" id="post_tag_ids_4" name="post[tag_ids][]" value="4">

  <label for="post_tag_ids_5">footag5</label>
  <input type="checkbox" checked="checked" id="post_tag_ids_5" name="post[tag_ids][]" value="5">

  <input type="hidden" name="id" value="1">
  <input type="submit" name="commit" value="Update Post">
</form>
```
