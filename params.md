

<html>
  <form method="post" action="/posts" accept-charset="utf8"> 
   <input type="text" name="post['title']">
   <input type="text" name="post['body']">
   <input type="hidden" name="authenticity_token" 
          value="<%=form_authenticity_token%>">
   <label for="post_tag_ids_1">Tag1</label>    
   <input type="checkbox" name="post['tag_ids]" value="1">
   <label for="post_tag_ids_2">Tag2</label>
   <input type="checkbox" name="post['tag_ids]" value="2" checked>
   <label for="post_tag_ids_3">Tag3</label>
   <input type="checkbox" name="post['tag_ids]" value="3" checked>
   <label for="post_tag_ids_1">Tag5</label>
   <input type="checkbox" name="post['tag_ids]" value="5" checked>
  </form>
</html>