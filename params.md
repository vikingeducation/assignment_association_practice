```html
<h1>Raw HTML</h1>

<form action="/posts/1" method="post">
  <input type="hidden" name="_method" value="patch">
  <input type="hidden" name="authenticity_token" value="<%= authenticity_token %>">
  <input type="hidden" name="utf8" value="✓">
  <input type="hidden" name="id" value="1">

  <label for="post_title_id">Title</label> <br>
  <input id="post_title_id" type="text" name="post[title]" value="My Super Title">

  <label for="post_body_id">Body</label> <br>
  <input id="post_body_id" type="text" name="post[body]" value="Some Body of a post">

  <label>
    Tags <br>
    <input type="checkbox" name="post[tag_ids][]" value="2">
    <input type="checkbox" name="post[tag_ids][]" value="3">
    <input type="checkbox" name="post[tag_ids][]" value="5">
    <input type="hidden" name="post[tag_ids][]" value="">
  </label>

</form>
```
