
```html
<form action="/posts/1" method="post" accept-charset="UTF-8">
	<input type="hidden" name="authenticity_token" value="<%=form_authenticity_token%>">
	<input type="text" name="post[title]" value="My Super Title" />
	<input type="text" name="post[body]" value="Some Body of a post" /> 
	
    <input checked="unchecked" id="post_tag_ids_1" name="post[tag_ids][]" type="checkbox" value="1" />

    <input checked="checked" id="post_tag_ids_2" name="post[tag_ids][]" type="checkbox" value="2">
 
    <input checked="checked" id="post_tag_ids_3" name="post[tag_ids][]" type="checkbox" value="3">
  
    <input checked="unchecked" id="post_tag_ids_4" name="post[tag_ids][]" type="checkbox" value="4">
  
    <input checked id="post_tag_ids_5" name="post[tag_ids][]" type="checkbox" value="5">
		
	<input checked="checked" name="post[tag_ids][]" type="hidden" value="">
</form>
```