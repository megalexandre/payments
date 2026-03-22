require 'database_cleaner/active_record'

# Enable JavaScript testing for @javascript tagged scenarios
Before('@javascript') do
  DatabaseCleaner.strategy = :truncation
end

Before('not @javascript') do
  DatabaseCleaner.strategy = :transaction
  DatabaseCleaner.start
end

After('not @javascript') do
  DatabaseCleaner.clean
end

# Allow Rails to rescue exceptions for @allow-rescue tagged scenarios
Before('@allow-rescue') do
  ActionController::Base.allow_rescue = true
end

After('@allow-rescue') do
  ActionController::Base.allow_rescue = false
end
