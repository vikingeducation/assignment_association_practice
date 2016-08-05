<form action='/posts/1' method='post' accept-charset='utf-8'>
  <input type='hidden' value='<%= form_authenticity_token %>' name='authenticty token'>
  <input type='text' name='post[title]' value='My Super Title'>
  <input type='text' name='post[body]' value='Some Body of a post'>
  <input name="post[tag_ids][]" type="hidden" value="">
  <input type='checkbox' name='post[tag_ids][]' value='1' checked=''>
  <input type='checkbox' name='post[tag_ids][]' value='2' checked='checked'>
  <input type='checkbox' name='post[tag_ids][]' value='3' checked='checked'>
  <input type='checkbox' name='post[tag_ids][]' value='4' checked=''>
  <input type='checkbox' name='post[tag_ids][]' value='5' checked='checked'>
  <input type='submit' value='Update Post'>
</form>