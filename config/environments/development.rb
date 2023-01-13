require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Conf for devise lib
  port = ENV.fetch('PORT', 3000)
  host = ENV.fetch('HOST', 'localhost')
  config.action_mailer.default_url_options({ host:, port: })

  # Spring reloads application code, and therefore needs the application to have reloading enabled.
  config.enable_reloading = true
  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = true

  # Show full error reports.
  config.consider_all_requests_local = false

  # Enable server timing
  config.server_timing = true

  # Redis cache store will automatically require and use hiredis if available. No further configuration is needed.
  cache_servers = %w[redis://localhost:6379/0]
  config.cache_store = :redis_cache_store, { url: cache_servers,

                                             connect_timeout: 30, # Defaults to 20 seconds
                                             read_timeout: 0.2, # Defaults to 1 second
                                             write_timeout: 0.2, # Defaults to 1 second
                                             reconnect_attempts: 1, # Defaults to 0

                                             error_handler: lambda { |method:, returning:, exception:|
      # Report errors to Sentry as warnings
      Raven.capture_exception exception, level: 'warning',
                                         tags: { method:, returning: }
                                                            } }
  config.action_controller.perform_caching = true
  config.session_store :cache_store, key: ENV['APP_SESSION_KEY']
  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.disable_request_forgery_protection = true
end
