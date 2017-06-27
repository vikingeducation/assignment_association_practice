solution_association_practice | association_calisthenics
========================================================





## Overview

This assignment focused on exploring every detail of creating and manipulating Rails associations. At times it may have felt like renaming for the sake of renaming. The point however was to gain the ability to understand how to rename and what specific information Rails needs to setup associations how you want them.



## Reviewing Your Solution

Here are some quesions to ask yourself while reviewing your code:


### Associations

* Carefully check the solution for each model. Did you specify `:class_name`, `:through`, `:source` and/or `:foreign_key` attributes in the hashes you pass to the association methods?
* Does your setup match the solution?
* If it does, great! If it doesn't carefully examine what is different. Is it producing the same outcome?
* There is more than one way to get to the result of some of these associations, the question is did you find another way? Or is there a bug in your association references?
* Can you concisely explain why an association produces a given result? If not, there's a chance it might not be working the way you intend.
* Can you explain the generated `JOIN` tables from your associations?
* Is each side of an association, e.g. users and comments, dependent or independent of the other?


### Dependents

* Did you specify `dependent: :destroy` where dependent rows are to be removed completely?
* Did you specify `dependent: :nullify` where dependent rows are to have their foreign ID set to `NULL`?
* Can you explain why destroy this association vs. why nullify another? What is the benefit of each? What is the drawback?


## Introducing Our Solution

### Installation

To get started you must clone and `cd` into the repo.

Next you'll need to `$ bundle install`. Now this project is a bit different to run.


### Files

- `db/seeds.rb`
- `associations_tests.rb`
- `dependency_tests.rb`
- `example.sh`


### Running examples

Because we haven't covered Rails testing yet, this solution is going to be a bit odd to run. However it will introduce you to a pretty cool Rails command called  [the `rails runner`](http://guides.rubyonrails.org/command_line.html#rails-runner). Basically it runs a script in the context of your Rails app like the `rails console`.

The examples for associations are in `associations_tests.rb` and the examples for dependents are in `dependency_tests.rb`.

To run the examples you need to run these scripts in the context of the Rails app, you also need to seed the database before. Normally a test suite would do this all for you, but since we didn't learn that yet, we've set up a quick shell script for you to run the script. Run:


```bash
$ bash example.sh
```

You'll see the output telling you which examples are running. To examine them further and play around with them go to the individual files.



## Key Tips and Takeaways

1. **SHORT ANSWER for associations, Rails decides everything it does behind the scenes from the association name. If it doesn't provide enough information for Rails to guess the rest, you must provide it yourself.**


1. **`:class_name` is used to tell Rails the name of a model for an association that cannot be determined from the association name.** For example, if your column name is `user_id` and you wish to call the association `author` you'll need to specify the `:class_name => 'User'`.


1. **`:foreign_key` is used to tell Rails the name of a foreign key in the table of the model that cannot be determined from the association name.** For example, if the association is `author` on the `Comment` model and the foreign key is `user_id` you need to specify `:foreign_key => 'user_id'`.

    ```ruby
    class Comment < ApplicationRecord
      belongs_to :author, :class_name => 'User', :foreign_key => 'user_id'
      #...
    end
    ```

1. **`:through` is used to allow access to an association on another association.** For example, if you have a join table for `UserPosting` where each instance has an association for a user and a post and you want to gain access to the users or posts, you can do so by using `:through`.


    ```ruby
    class UserPosting < ApplicationRecord
      belongs_to :user
      belongs_to :post
      validates :user_id, :uniqueness => {:scope => :post_id}
    end
    ```

    ```ruby
    class User < ApplicationRecord
      has_many :post_authorings, :class_name => 'UserPosting', :dependent => :destroy
      has_many :authored_posts, :through => :post_authorings, :class_name => 'Post', :source => :post
      #...
    end
    ```

1. **`:source` is used in conjunction with `:through` when the target association cannot be determined by the association name.** For example, a user has many `authored_posts`. This is an association found `:through => :post_authorings`. However, Rails doesn't know by the association name `authored_posts` to look for an association called `post`. By default it will look for `author_posts` on `post_authorings` which does not exist. For this reason you must specify `:source => :post` to tell Rails to look for the `post` association on `post_authorings`.

    ```ruby
    class User < ApplicationRecord
      #...
      has_many :authored_posts, :through => :post_authorings, :class_name => 'Post', :source => :post
      #...
    end
    ```

1. **`:dependent => :destroy` is used to destroy all rows associated with the model instance.** For example, a user has many comments with a `:dependent => :destroy` set. This will destroy all of the comments with a `user_id` value of that user's ID when that user is destroyed.

    ```ruby
    class User < ApplicationRecord
      #...
      has_many :authored_comments, :class_name => 'Comment', :dependent => :destroy
      #...
    end
    ```

1. **`:dependent => :nullify` is used to set the ID of the foreign key in the associated table to `NULL`.** This removed the reference to the deleted row. For example, if a category has many posts with `:dependent => :nullify` and it is deleted, the foreign key for the category ID in those posts will be set to `NULL`.

    ```ruby
    class Category < ApplicationRecord
      has_many :posts, :dependent => :nullify
    end
    ```


## Good Student Solutions

* [Julia Herron's Solution](https://github.com/cadyherron/assignment_association_practice)
* [Thomas Lo's Solution](https://github.com/thomasjinlo/assignment_association_practice)




** NOTE:** *This solution repo is copyrighted material for your private use only and not to be shared outside of Viking Code School.*



