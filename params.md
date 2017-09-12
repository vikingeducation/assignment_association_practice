<form method="post" action="posts/1">
  <input type="hidden" name="_method_" value="patch">
  <input type="hidden" name="authenticity_token" value="+8liMahjMiyA0WFF8ef8wzXu72+xXIKxlYzuI5UcTC4=">
  <input type="hidden" name="utf-8" value="✓">

  <label>
    Title
    <input type="text" name="post[title]">
  </label>

  <label>
    Body
    <textarea name="post[body]">Some Body of a post</textarea>
  </label>

  <input type="hidden" name="post[tag_ids][]" value="">

  <input id="post_tag_ids_1" name="post[tag_ids][]" type="checkbox" value="1">
  <label for="post_tag_ids_1">Tag 1</label>

  <input checked="checked" id="post_tag_ids_2" name="post[tag_ids][]" type="checkbox" value="2">
  <label for="post_tag_ids_2">Tag 2</label>

  <input checked="checked" id="post_tag_ids_3" name="post[tag_ids][]" type="checkbox" value="3">
  <label for="post_tag_ids_3">Tag 3</label>

  <input id="post_tag_ids_4" name="post[tag_ids][]" type="checkbox" value="4">
  <label for="post_tag_ids_4">Tag 4</label>

  <input checked="checked" id="post_tag_ids_5" name="post[tag_ids][]" type="checkbox" value="5">
  <label for="post_tag_ids_5">Tag 5</label>

  <input type="submit" name="commit" value="Update Post">

  <input type="hidden" name="id" value="1">
</form>
