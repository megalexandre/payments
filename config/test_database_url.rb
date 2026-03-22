require "uri"

module TestDatabaseUrl
  module_function

  def apply!
    return unless ENV["RAILS_ENV"] == "test" || ENV["RACK_ENV"] == "test"

    database_url = ENV["TEST_DATABASE_URL"]
    database_url = ENV["DATABASE_URL"] if database_url.nil? || database_url.empty?
    return if database_url.nil? || database_url.empty?

    uri = URI.parse(database_url)
    database_name = uri.path.sub(%r{\A/}, "")
    return if database_name.empty?

    unless database_name.end_with?("_test")
      database_name = if database_name.end_with?("_development")
        database_name.sub(/_development\z/, "_test")
      else
        "#{database_name}_test"
      end
    end

    uri.path = "/#{database_name}"
    ENV["DATABASE_URL"] = uri.to_s
    ENV["DATABASE_CLEANER_ALLOW_REMOTE_DATABASE_URL"] ||= "true"
  rescue URI::InvalidURIError
    nil
  end
end

TestDatabaseUrl.apply!