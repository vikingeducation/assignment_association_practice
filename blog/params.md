<!-- params.md -->

<!-- Warmup - Patch raw HTML in erb  -->

<form>
  <input name="_method" type="hidden" value="patch">
  <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
  <label>Title
  <input type="text" name="post[title]" value="My Super Title">
</label>
  <input type="text" name="post[body]" value="Some Body of a Post">
  <input type="text" name="post[tag_id]" value=["", "2", "3", "5"]>
  <input type="submit" name="commit" value="Update Post">
  <input type="text" name="id" value="1">
</form>
