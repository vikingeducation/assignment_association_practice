<form action = '/posts/1' method = 'patch'>
  <input name="utf8" type="hidden" value="✓">
  <input name="authenticity_token" type="hidden" value= <%form_authenticity_token %>>
  <label>
    Title
    <input type = "text" name = "post[title]" value = "My Super Title">
  </label>
  <label>
    Body
    <input type = "text" name = "post[body]" value = "Some Body of a post">
  </label>
  <input type = "checkbox" name = "post[tag_ids][]" value = "1">
  <input type = "checkbox" name = "post[tag_ids][]" value = "2" checked ="checked">
  <input type = "checkbox" name = "post[tag_ids][]" value = "3" checked = "checked">
  <input type = "checkbox" name = "post[tag_ids][]" value = "4">
  <input type = "checkbox" name = "post[tag_ids][]" value = "5" checked = "checked">
  <input type ="hidden" name = "post[tag_ids][]" value ="">
  <inputs type = "submit" name = "commit" value = "Update Post">
 </form>