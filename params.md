params.md

	<%= @post.title %> 
	<%= @post.body %> 
	<select multiple name="tag_ids">	
	<%= @tags.each do |tag| %>
		<option value = "<%=@tag.id%>"> <%= @tag.name %> </option>  
	<% end %> 
	</select>
 <%= submit %> 
