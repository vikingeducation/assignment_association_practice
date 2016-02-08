# Params

<form action="/posts/1" method="post">
  <input type="hidden" name="_method" value="patch">
  <input type="hidden" name="authenticity_token" value="+8liMahjMiyA0WFF8ef8wzXu72+xXIKxlYzuI5UcTC4=">
  <input type="hidden" name="utf8" value="√">

  <label for="post_title">Title</label>
  <input type="text" id="post_title" name="post[title]" value="My Super Title">

  <label for="post_title">Body</label>
  <input type="text" id="post_body" name="post[body]" value="Some Body of a post">

  <label for="post_tag_ids_1">1</label>
  <input id="post_tag_ids_1" name="post[tag_ids][]" type="checkbox" value="1">

  <label for="post_tag_ids_2">2</label>
  <input checked="checked" id="post_tag_ids_2" name="post[tag_ids][]" type="checkbox" value="2">

  <label for="post_tag_ids_3">3</label>
  <input checked="checked" id="post_tag_ids_3" name="post[tag_ids][]" type="checkbox" value="3">

  <label for="post_tag_ids_4">4</label>
  <input id="post_tag_ids_4" name="post[tag_ids][]" type="checkbox" value="4">

  <label for="post_tag_ids_5">5</label>
  <input checked="checked" id="post_tag_ids_5" name="post[tag_ids][]" type="checkbox" value="5">

  <input name="post[tag_ids][]" type="hidden" value="">

  <input type="submit" name="commit" value="Update Post">
</form>
