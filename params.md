<form accept-charset="UTF-8" action="/posts/1" method="post">
  
  <input name="authenticity_token" type="hidden" value="<%= form_authenticity_token %>">

  <label>Title</label>
  <input type="text" name="title" value="My Super Title">

  <label>Body</label>
  <input type="text" name="body" value="Some Body of a Post">

  <label>Tags</label>
  <input type="checkbox" name="tag_ids" value="1" checked>
  <input type="checkbox" name="tag_ids" value="2" checked>
  <input type="checkbox" name="tag_ids" value="3" checked>
  <input type="checkbox" name="tag_ids" value="4">
  <input type="checkbox" name="tag_ids" value="5" checked>

  <input type="submit" name="commit" value="Update Post">
  
</form>