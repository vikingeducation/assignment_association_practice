```html
<form action="/posts/1" method="post">
  <input name="utf8" type="hidden" value="&#x2713;" />
  <input name="authenticity_token" value="<%= form_authenticity_token %>" type="hidden">
  <input type="hidden" name="id" value="1">
  
  <input type="text" name="post[title]" id="post_title">
  <input type="text" name="post[title]" id="post_body">
  <input type="checkbox" name="post[tag_ids][]" id="post_tag_ids_2" value="2">
  <input type="checkbox" name="post[tag_ids][]" id="post_tag_ids_3" value="3">
  <input type="checkbox" name="post[tag_ids][]" id="post_tag_ids_5" value="5">
  <input type="hidden" name="tag_ids" id="post[tag_ids][]" value="5">
  <input type="submit" value="Update Post">
</form>
```
