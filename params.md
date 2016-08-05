<form method="post" action="/posts/<%= @post.id %>">
  <input type="hidden" name="_method" value="patch" />
  <input name="utf8" type="hidden" value="✓">
  <input name="authenticity_token" type="hidden" value="<%= form_authenticity_token %>">

  <input type="text" name="post[title]" />
  <input type="textarea" name="post[body]" />

  <label for="post_tag_ids_1">footag1</label>
  <input checked="checked" id="post_tag_ids_1" name="post[tag_ids][]" type="checkbox" value="1">

  <label for="post_tag_ids_2">footag2</label>
  <input checked="checked" id="post_tag_ids_2" name="post[tag_ids][]" type="checkbox" value="2">

  <label for="post_tag_ids_3">footag3</label>
  <input checked="checked" id="post_tag_ids_3" name="post[tag_ids][]" type="checkbox" value="3">

  <label for="post_tag_ids_4">footag2</label>
  <input checked="checked" id="post_tag_ids_4" name="post[tag_ids][]" type="checkbox" value="4">

  <label for="post_tag_ids_5">footag3</label>
  <input checked="checked" id="post_tag_ids_5" name="post[tag_ids][]" type="checkbox" value="5">

  <input name="post[tag_ids][]" type="hidden" value="" />

  <input type="submit" value="Update Post" />
</form>
