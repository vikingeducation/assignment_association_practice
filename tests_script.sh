

# Run this example file to run:

# 1. Seeds
bundle exec rake db:seed > /dev/null

# 2. Associations
rails runner associations_tests_part2.rb

# 3. Dependency Handling
rails runner dependency_tests.rb
