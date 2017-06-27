practice_with_nested_forms
==========================







## Overview

This assignment opens up the door of CRUDing associated models through nested forms. It may have feel odd to create nested forms with the Rails helpers and put nested entries in your strong parameters, however this is a powerful Rails feature that you will use much in the future.



## Reviewing Your Solution

Ask yourself the following questions while reviewing your code:

* Can you explain in depth the journey parameters take from the HTML form to the controller to the model?
* How did you display a form for creating a new comment at the bottom (or top) of your persisted comments?
* How did you ensure that an empty comment wasn't created from the empty form for creating a new comment?
* How did you make sure your new comment was associated with the new/persisted post?
* How did you destroy comments in your list by use of a checkbox instead of a button for individual DELETE requests?



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
    - `models/post.rb`
    - `views/`
        - `posts/*`


### Running the Solution

Run the server with `$ rails s` and open up `http://localhost:3000`. You should seed a list of posts in the posts index.


### Nested Forms

The nested form examples are at the top of the new/edit post form page in a section labeled "Practice with Nested Forms". Play around with creating posts and deleting/creating comments.



## Key Tips and Takeaways

1. **If you need a new instance of an association for a nested form, use the `model.association_collection.build` method to create a new instance (not persisted).** This will create a new instance of the association that is not persisted to the database yet. This is perfect for placing in your new comment form.

    ```ruby
    class PostsController < ApplicationController
      before_action :set_post, :except => [:index]
      before_action :build_comment, :only => [:new, :edit]

      #...

      private
      def set_post
        @post = Post.exists?(params[:id]) ? Post.find(params[:id]) : Post.new
      end

      def build_comment
        @post.comments.build
      end

      #...
    end
    ```

1. **Use `:reject_if => :all_blank` to keep blank nested resources from being created when using `accepts_nested_attributes_for`.** This will keep that new comment from being created when the user submits a form with a completely blank comment.

    ```ruby
    class Post < ApplicationRecord
      #...

      accepts_nested_attributes_for :comments,
                                    :reject_if => :all_blank,
                                    :allow_destroy => true
    end
    ```

1. **Use `:allow_destroy` with `_destroy` to enable destroying nested resources in your nested forms.** This enables the checkboxes on comments to delete multiple comments in one form submit.

    ```ruby
    class Post < ApplicationRecord
      #...

      accepts_nested_attributes_for :comments,
                                    :reject_if => :all_blank,
                                    :allow_destroy => true
    end
    ```

    ```erb
    <% if comment_fields.object.persisted? %>
      <%= comment_fields.label(:_destroy, "Delete?", :class => 'text-danger') %>
      <%= comment_fields.check_box(:_destroy) %>
    <% end %>
    ```




## Good Student Solutions

* [Julia Herron's Solution](https://github.com/cadyherron/assignment_association_practice)
* [Thomas Lo's Solution](https://github.com/thomasjinlo/assignment_association_practice)




** NOTE:** *This solution repo is copyrighted material for your private use only and not to be shared outside of Viking Code School.*






