<form action="/posts/<%= @post.id %>" method="post">
  <input name="_method" type="hidden" value="patch">
  <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
  <input type="hidden" name="UTF8" value="✓">
  <input type="text" name="post[title]">
  <textarea name="post[body]"></textarea>
  <input id="post_tag_ids_2" type="checkbox" name="post[tag_ids][]" value="2">
  <input id="post_tag_ids_3" type="checkbox" name="post[tag_ids][]" value="3">
  <input id="post_tag_ids_5" type="checkbox" name="post[tag_ids][]" value="5">

  <input type="hidden" name="post[tag_ids][]" value="">
  <input type="submit" name="commit" value="Update Post">
</form>