require "cgi"
require "erb"
require "pathname"
require "pg"
require "uri"
require "yaml"

module TestDatabaseSetup
  module_function

  APP_ROOT = Pathname.new(File.expand_path("../..", __dir__))

  def ensure_test_database!
    return unless ENV["RAILS_ENV"] == "test" || ENV["RACK_ENV"] == "test"

    config = database_config
    return if config.nil? || config[:database].to_s.empty?
    return if database_exists?(config)

    Dir.chdir(APP_ROOT) do
      system({ "RAILS_ENV" => "test" }, "bin/rails", "db:prepare", exception: true)
    end
  end

  def database_config
    url = ENV["DATABASE_URL"].to_s
    return config_from_url(url) unless url.empty?

    config_from_database_yml
  end

  def config_from_url(url)
    uri = URI.parse(url)

    {
      adapter: uri.scheme,
      database: CGI.unescape(uri.path.delete_prefix("/")),
      host: uri.host,
      port: uri.port,
      user: CGI.unescape(uri.user.to_s),
      password: CGI.unescape(uri.password.to_s),
      maintenance_database: "postgres"
    }
  rescue URI::InvalidURIError
    nil
  end

  def config_from_database_yml
    raw_config = ERB.new(APP_ROOT.join("config/database.yml").read).result
    config = YAML.safe_load(raw_config, aliases: true) || {}
    test_config = (config["test"] || {}).transform_keys(&:to_sym)
    return if test_config.empty?

    test_config[:maintenance_database] ||= "postgres"
    test_config
  end

  def database_exists?(config)
    connection = PG.connect(
      dbname: config[:maintenance_database],
      host: presence(config[:host]),
      port: config[:port],
      user: presence(config[:user]),
      password: presence(config[:password])
    )

    connection.exec_params("SELECT 1 FROM pg_database WHERE datname = $1", [config[:database]]).ntuples.positive?
  ensure
    connection&.close
  end

  def presence(value)
    return if value.nil? || value.empty?

    value
  end
end

TestDatabaseSetup.ensure_test_database!