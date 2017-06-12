require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SocialNetwork
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.enabled = true
    config.logger = ActiveSupport::Logger.new('SocialNetwork.log')
    #config.assets.paths << Rails.root.join("app","assets", "javascripts")
    config.assets.paths << Rails.root.join("vendor","assets", "fonts")
    config.assets.paths << Rails.root.join("vendor","assets", "img")
    config.to_prepare do
        Devise::SessionsController.layout proc{ |controller| action_name == 'new' ? "login"   : "user" }
    end
  end
end
