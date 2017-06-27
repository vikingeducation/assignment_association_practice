<!-- params.md -->



<form>
  <input name="_method" type="hidden" value="patch">
  <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
  <input type="text" name="post[title]" value="My Super Title">
  <input type="text" name="post[body]" value="Some Body of a Post">
  <input type="text" name="post[tag_id]" value=["", "2", "3", "5"]>
  <input type="submit" name="commit" value="Update Post">
  <input type="text" name="id" value="1">
</form>

...
  <input type="text" name="post[title]">
  <input type="text" name="post[body]">
...

<input type="radio" name="gender" value="male">
#=> Parameters: {... "gender"=>"male" ...}

<input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
#=> <input name="authenticity_token" type="hidden" value="jJa87aK1OpXfjojryBk2Db6thv0K3bSZeYTuW8hF4Ns=">



