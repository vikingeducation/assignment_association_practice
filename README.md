# assignment_association_practice
Just associates associatin'...


See these files in the root directory for the examples using the models:

- associations_tests.rb
- dependency_tests.rb

You can run these files in the rails console to see them in action:
**NOTE: you must ruby `$ bundle exec rake db:seed` before running these files**


```shell
$ rails c
```

```ruby
irb> load 'associations_tests.rb'
```

```ruby
irb> load 'dependency_tests.rb'
```

The implementation of the associations can be found in the model files:

- app/models/category.rb
- app/models/comment.rb
- app/models/post.rb
- app/models/post_tagging.rb
- app/models/tag.rb
- app/models/user.rb
- app/models/user_posting.rb

**NOTE: the use of `:dependent => :destroy` to destroy dependent associations**
**NOTE: the use of `:dependent => :nullify` to nullify dependent associations**

