# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Testing with Cucumber

This project uses Cucumber for integration testing with BDD (Behavior-Driven Development) approach.

### Running Cucumber Tests

```bash
# Run all tests
bundle exec cucumber

# Run specific feature file
bundle exec cucumber features/payments.feature

# Run tests with specific tags
bundle exec cucumber --tags "@wip"
bundle exec cucumber --tags "not @wip"

# Run with HTML report
bundle exec cucumber --profile html

# Run for CI/CD pipeline
bundle exec cucumber --profile ci
```

### Test Structure

- **features/**: Feature files written in Gherkin language
- **features/step_definitions/**: Step implementations
- **features/support/**: Configuration and hooks (database setup, etc.)
- **config/cucumber.yml**: Cucumber profiles and configurations

For detailed information about running and writing Cucumber tests, see [features/README.md](features/README.md).
