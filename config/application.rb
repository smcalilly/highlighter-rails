require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # include lib directory
    config.autoload_paths << Rails.root.join('lib')

    config.middleware.insert_before 0, Rack::Cors, :debug => true, :logger => (-> { Rails.logger }) do
      allow do
        origins ['moz-extension://ce763ad1-e4f3-ca4d-b974-810788b069ca', 'chrome-extension://jhbdfidbplpijoncnlfooepldoleioga']

        resource 'highlights', 
          headers: :any, 
          methods: [:get, :post, :options]
      end
    end
  end
end
