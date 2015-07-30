<form accept-charset="UTF-8", action="/posts/1" method="post">
  <input name="_method" value="PATCH" type="hidden"/>

  <input name="post[title]" value="My Super Title"/>
  <input name="post[body]" value="Some Body of a Post"/>

  <input checked="checked" name="post[tag_ids][]" type="checkbox" value="1">
  <input checked="checked" name="post[tag_ids][]" type="checkbox" value="2">
  <input checked="checked" name="post[tag_ids][]" type="checkbox" value="3">
  <input checked="checked" name="post[tag_ids][]" type="checkbox" value="4">
  <input checked="checked" name="post[tag_ids][]" type="checkbox" value="5">

  <input checked="checked" name="post[tag_ids][]" type="hidden" value="">

  <input type="submit">
</form>
