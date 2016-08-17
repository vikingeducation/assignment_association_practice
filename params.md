<form>

<form action="/posts" method="patch">
  <label for="post[title]title">Title:</label>
  <input type="text" name="post[title] value="" />
  <label>
    Yes
    <input type="radio" name="post-sfw" value="sfw" />
  </label>
  <label for="post-nsfw">No</label>
    <input type="radio" name="post-sfw" value="nsfw" id="nsfw" />
  </label>
  <input type="text" value="this is already here!">
  <textarea name="body" rows="10" cols="30"></textarea>
  <input id="example-password" type="password">
  <input type="radio" name="sex" value="male" checked="true">Male
  <input type="radio" name="sex" value="female">Female
  <label>
