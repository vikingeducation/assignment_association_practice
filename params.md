<form>
  <input name="utf8" type="hidden" value="&#x2713;" />
  <input name="authenticity_token" type="hidden" value="+8liMahjMiyA0WFF8ef8wzXu72+xXIKxlYzuI5UcTC4=" />

  <input name="post[title]" /input>
  <input name="post[body]" /input>
  <!-- <select>
    <option name="post[tag_ids][0]" value=""></option>
    <option name="post[tag_ids][1]" value="2"></option>
    <option name="post[tag_ids][2]" value="3"></option>
    <option name="post[tag_ids][3]" value="5"></option>
  </select> -->
  <label for="post_tag_ids_1">footag1</label>
  <input  checked="checked" 
          id="post_tag_ids_1" 
          name="post[tag_ids][]" 
          type="checkbox" 
          value="">
  <label for="post_tag_ids_2">footag2</label>
  <input  checked="checked" 
          id="post_tag_ids_2" 
          name="post[tag_ids][]" 
          type="checkbox" 
          value="2">
  <label for="post_tag_ids_3">footag3</label>      
  <input  checked="checked" 
          id="post_tag_ids_3" 
          name="post[tag_ids][]" 
          type="checkbox" 
          value="3">
  <label for="post_tag_ids_4">footag4</label>      
  <input  checked="checked" 
          id="post_tag_ids_4" 
          name="post[tag_ids][]" 
          type="checkbox" 
          value="5">
  <input type="submit" value="Update Post"/>
  <input name="id" />
</form>