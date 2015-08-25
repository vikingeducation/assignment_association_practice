<form action="/post/1" method="post">
  <input name="_method" type="hidden">
  <input name="utf8" type="hidden" value="✓">
   <input name="authenticity_token" type="hidden" value="<%=form_authenticity_token%>">
  

    <input name="title" type="text" value="My super title">
    <input name="body" type="text" value="Some Body of a post">
   <input checked="checked" name="post[tag_ids][]" type="checkbox" value="2">

   <input checked="checked" name="post[tag_ids][]" type="checkbox" value="3">

   <input checked="checked"  name="post[tag_ids][]" type="checkbox" value="5">

   <input  name="post[tag_ids][]" type="hidden" value="">

   <input  name="commit" type="submit" value="Update Post">

</form>
