<form method="/posts/1" action="post">
  <input name="utf8" type="hidden" value="✓">
  <input name="authenticity_token" type="hidden" value="<%= form_authenticity_token %>">
  <input type="text" name="post[title]">
  <textarea name="post[body]"></textarea>
  <input type="hidden" name="post[tag_ids][]" value="" checked>
  <input type="checkbox" name="post[tag_ids][]" value="1">
  <input type="checkbox" name="post[tag_ids][]" value="2">
  <input type="checkbox" name="post[tag_ids][]" value="3">
  <input type="checkbox" name="post[tag_ids][]" value="4">
  <input type="checkbox" name="post[tag_ids][]" value="5">
  <input type="submit" value="Update Post">
</form>