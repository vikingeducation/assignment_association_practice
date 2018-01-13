#1.

<%= form_for post do |pt| %>
  <%= pt.label :title %><br>
  <%= pt.text_field :title, disabled: disable %><br>
  <%= pt.label :body %><br>
  <%= pt.text_area :body, disabled: disable %><br><br>
Tags:<br><br>
  <%= pt.collection_check_boxes(:tag_ids, Tag.all, :id, :name, {}, disabled: disable)  %>
  <br><br>
  <% if current_page?(post_path(post)) %>
    <%= link_to "Back to All Posts", posts_path %>
    <%= link_to "Edit Post", edit_post_path(post) %>
    <%= link_to "Delete Post", "#" %>
  <% else %>
    <%= pt.submit %>
  <% end %>
<% end %>


#2.

  1.
      <%= form_for post do |pt| %>
        <%= pt.label :title %><br>
        <%= pt.text_field :title, disabled: disable %><br>
        <%= pt.label :body %><br>
        <%= pt.text_area :body, disabled: disable %><br><br>
        <h3>Tags:</h3><br><br>
        <%= pt.collection_check_boxes(:tag_ids, Tag.all, :id, :name, {}, disabled: disable)  %><br><br>
        <h3>Category:</h3><br><br>
        <%= pt.collection_radio_buttons(:category_id, Category.all, :id, :name, {}, disabled: disable) %><br>
        <br><br>
        <% if current_page?(post_path(post)) %>
          <%= link_to "Back to All Posts", posts_path %>
          <%= link_to "Edit Post", edit_post_path(post) %>
          <%= link_to "Delete Post", "#" %>
        <% else %>
          <%= pt.submit %>
        <% end %>
      <% end %>

  2.
      <%= form_for post do |pt| %>
        <%= pt.label :title %><br>
        <%= pt.text_field :title, disabled: disable %><br>
        <%= pt.label :body %><br>
        <%= pt.text_area :body, disabled: disable %><br><br>
        <h3>Tags:</h3><br><br>
        <%= pt.collection_check_boxes(:tag_ids, Tag.all, :id, :name, {}, disabled: disable)  %><br><br>
        <h3>Category:</h3><br><br>
        <%= pt.collection_select(:category_id, Category.all, :id, :name, {}, disabled: disable) %>
        <br><br>
        <% if current_page?(post_path(post)) %>
          <%= link_to "Back to All Posts", posts_path %>
          <%= link_to "Edit Post", edit_post_path(post) %>
          <%= link_to "Delete Post", "#" %>
        <% else %>
          <%= pt.submit %>
        <% end %>
      <% end %>

  3.
      <%= form_for post do |pt| %>
        <%= pt.label :title %><br>
        <%= pt.text_field :title, disabled: disable %><br>
        <%= pt.label :body %><br>
        <%= pt.text_area :body, disabled: disable %><br><br>
        <h3>Tags:</h3><br><br>
        <%= pt.collection_check_boxes(:tag_ids, Tag.all, :id, :name, {}, disabled: disable)  %><br><br>
        <h3>Category:</h3><br><br>
        <h4>Form_tag Dropdown</h4>
        <%= select_tag(:category, options_from_collection_for_select(Category.all, :id, :name, post.category.id), disabled: disable) %>
        <br><br>
        <% if current_page?(post_path(post)) %>
          <%= link_to "Back to All Posts", posts_path %>
          <%= link_to "Edit Post", edit_post_path(post) %>
          <%= link_to "Delete Post", "#" %>
        <% else %>
          <%= pt.submit %>
        <% end %>
      <% end %>

#3.
    <%= form_for post do |pt| %>
      <%= pt.label :title %><br>
      <%= pt.text_field :title, disabled: disable %><br>
      <%= pt.label :body %><br>
      <%= pt.text_area :body, disabled: disable %><br><br>
      <h3>Tags:</h3>
      <h4>Combo-Box:</h4>
      <%= pt.select(:tag_ids, options_for_select(@tag_options), {}, disabled: disable, multiple: true)  %><br><br>
      <% if current_page?(post_path(post)) %>
        <%= link_to "Back to All Posts", posts_path %>
        <%= link_to "Edit Post", edit_post_path(post) %>
        <%= link_to "Delete Post", "#" %>
      <% else %>
        <%= pt.submit %>
      <% end %>
    <% end %>

#4. done
#5.   
    <%= form_for post do |pt| %>
      <%= pt.label :title %><br>
      <%= pt.text_field :title, disabled: disable %><br>
      <%= pt.label :body %><br>
      <%= pt.text_area :body, disabled: disable %><br><br>
      <h3>Tags:</h3><br><br>
      <%= pt.collection_check_boxes(:tag_ids, Tag.all, :id, :name, {}, disabled: disable)  %><br><br>
      <h3>Category:</h3><br><br>
      <%= pt.collection_select(:category_id, Category.all, :id, :name, {include_blank: true}, disabled: disable, class: "good", id: "basic") %>
      <br><br>
      <% if current_page?(post_path(post)) %>
        <%= link_to "Back to All Posts", posts_path %>
        <%= link_to "Edit Post", edit_post_path(post) %>
        <%= link_to "Delete Post", "#" %>
      <% else %>
        <%= pt.submit %>
      <% end %>
    <% end %>
