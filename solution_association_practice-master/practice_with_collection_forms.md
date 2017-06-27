practice_with_collection_forms
==============================


## Overview

This assignment gave you the chance to dive into Rails collection form helpers on a detailed level. You explored how to use raw HTML to generate the parameters Rails expects from collection form elements as well as recreate a form with various collection form helpers. Understanding collection form helpers will streamline your workflow with Rails forms and complex model relationships.


## Reviewing Your Solution

While reviewing your solution ask yourself the following questions:

### HTML Form and Parameters

* Does your HTML form submit the same parameters as in the example?
* Are the parameters correctly nested?
* Do you submit an empty string in your collection of `tag_ids`?
* Why is this so important?


### Collection Forms

* When editing, did you run into the whitelisting IDs issue which causes multiple instances to keep getting added when you're editing?
* What differences do you notice working with the different types of form collection helpers?
* Did you use options link `:include_blank` for your `collection_select`?
* Did you use a `multiple` select box?



## Introducing Our Solution

### Installation

To get started you must clone and `cd` into the repo.

Next you'll need to `$ bundle install`. Then migrate and seed the database:

```bash
$ bunde exec rake db:migrate
$ bundle exec rake db:seed
```


### Files

- `app`
    - `controllers/`
        - `posts_controller.rb`
        - `static_pages_controller.rb`
    - `views/`
        - `posts/*`
        - `static_pages/*`


### Running the Solution

Run the server with `$ rails s` and open up `http://localhost:3000`. You should seed a list of posts in the posts index.


#### HTML Form

The HTML form is viewable from clicking the "HTML Form Example" in the nav bar. Upon form submit you'll see the submitted params in JSON format populated on the page.


#### Collection Forms

To view the collection forms click the new or edit button. You'll notice that the section pertaining to this assignment is in the "Practice with Collection Forms" section.


## Key Tips and Takeaways

1. **Collection form helpers have the same basic method signature.** If you notice, all collection form helpers expect a collection, display text for the input and value for the input. If you use the `form_tag` version of the helper you'll need to specify the name of the resource as the first argument. However, that is really all you need to remember. Rails makes it fairly easy to treat these helpers almost interchangeably.

    ```erb
      <div class="form-group">
        <%= f.label(:category_id, 'Category') %>
        <%= f.collection_radio_buttons(
          :category_id,
          Category.all,
          :id,
          :name
        ) do |r|
          radio = r.label {r.radio_button + r.text}
          %Q[<div class="radio">
            #{radio}
          </div>].html_safe
        end %>

      <div class="form-group">
        <%= label_tag('post_category_id', 'Category') %>
        <%= select_tag(
          'post[category_id]',
          options_from_collection_for_select(Category.all, :id, :name),
          :class => 'form-control',
          :include_blank => true
        ) %>
      </div>

      <div class="form-group">
        <%= label_tag(:tag_ids, 'Tags') %>
        <%= collection_check_boxes(
          :post,
          :tag_ids,
          Tag.all,
          :id,
          :name
        ) do |b|
          checkbox = b.label {b.check_box + b.text}
          %Q[<div class="checkbox">
            #{checkbox}
          </div>].html_safe
        end %>
      </div>
    ```

1. **Take advantage of the `select` helper's ability to include a blank option.** This is unique to `select` helpers. There is an options hash after the display name parameter that allows you to specify a bunch of [options](http://api.rubyonrails.org/classes/ActionView/Helpers/FormOptionsHelper.html#method-i-select). One of them is `:include_blank => true`. This will put a blank option in the select dropdown that allows the user to select nothing.

    ```erb
    <div class="form-group">
      <%= f.label(:category_id, 'Category') %>
      <%= f.collection_select(
        :category_id,
        Category.all,
        :id,
        :name,
        {:include_blank => true},
        {:class => 'form-control'}
      ) %>
    </div>
    ```



## Good Student Solutions

* [Julia Herron's Solution](https://github.com/cadyherron/assignment_association_practice)
* [Thomas Lo's Solution](https://github.com/thomasjinlo/assignment_association_practice)



** NOTE:** *This solution repo is copyrighted material for your private use only and not to be shared outside of Viking Code School.*











