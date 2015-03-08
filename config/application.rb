require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StuddyBuddy
  class Application < Rails::Application
    routes.default_url_options[:host] = 'localhost:3000'
    config.active_record.raise_in_transactional_callbacks = true
  end
end
