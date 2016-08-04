# Run this example file to run:

# 1. Seeds
bundle exec rake db:seed > /dev/null

# 2. Associations
rails runner integration_tests.rb

# 3. Dependency Handling
#rails runner dependency_tests.rb