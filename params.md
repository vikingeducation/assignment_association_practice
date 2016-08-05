<!DOCTYPE html>
<html>
<head>
  <title></title>
</head>
<body>


  <form action="/posts/1" method="post">
    <label for="title">Title</body>
    <input id="title" type="text" name="post[title]" value="My Super Title">
    <label for="body">Body</label>
    <input id="body" type="text" name="post[body]" value="Some Body of a post">
    <label for="tags">Tags</label>
    <input type="checkbox" name="post[tag_ids]" value="1">
    <input type="checkbox" name="post[tag_ids]" value="2">
    <input type="checkbox" name="post[tag_ids]" value="3">
    <input type="checkbox" name="post[tag_ids]" value="5">
  </form>

  
</body>
</html>