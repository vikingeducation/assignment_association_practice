<form action="/posts" method="post">
  <input name="utf8" type="hidden" value="✓">
  <input name="authenticity_token" type="hidden" value="t/72yWAJ4gzmlfy/QH6CQPbQx5Cz8MRK+/8fueweUU8=">

  <label for="post[title]">Title:</label>
  <input type="text" id="title" name="post[title]" />

  <label for="post[body]">Body:</label>
  <input type="text" id="body" name="post[body]" />

  <label for="post_tag_ids_1">Ruby</label>
  <input id="post_tag_ids_1" type="checkbox" name="post[tag_id]" value="1" />

  <label for="post_tag_ids_2">Coding</label>
  <input id="post_tag_ids_2" type="checkbox" name="post[tag_id]" value="2" />

  <label for="post_tag_ids_3">Football</label>
  <input id="post_tag_ids_3" type="checkbox" name="post[tag_id]" value="3" />

  <input name="post[tag_id][]" type="hidden" value="">
  <input name="id" type="hidden" value="post[id]">

  <input type="submit" value="Update Post">
</form>