require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Porfavor
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.i18n.default_locale = :'pt-BR'
    config.load_defaults 6.1
    config.assets.initialize_on_precompile = false
    config.time_zone = 'Brasilia'
    config.active_record.default_timezone = :utc
    config.action_mailer.default_url_options = { host: 'ecs-dirlic.centro.iff.edu.br' }
    config.action_mailer.smtp_settings = {
      :address => "mail.iff.edu.br",
      :port => 587,
      :domain => "iff.edu.br",
      :authentication => "plain",
      :user_name => "ecs-dirlic.centro@iff.edu.br",
      :password => "licenciatura2024#",
      :enable_starttls_auto => true,
      :openssl_verify_mode  => 'none'
    }

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #config.autoload_paths += %W(#{config.root}/app/pdf)
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end