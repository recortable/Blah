require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Rapid
  class Application < Rails::Application

    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    config.i18n.default_locale = :es
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable the asset pipeline
    config.assets.enabled = true

    config.to_prepare do
      Dir[Rails.root + 'lib/controllers/*.rb'].each { |f| load File.expand_path(f) }
      Dir[Rails.root + 'lib/models/*.rb'].each { |f| load File.expand_path(f) }
    end

  end
end
