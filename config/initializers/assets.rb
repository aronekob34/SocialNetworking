# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( custom.js )

# Images

Rails.application.config.assets.precompile += %w( avatar-mini.jpg )
Rails.application.config.assets.precompile += %w( avatar-mini2.jpg )
Rails.application.config.assets.precompile += %w( avatar-mini3.jpg )
Rails.application.config.assets.precompile += %w( avatar-mini4.jpg )
Rails.application.config.assets.precompile += %w( avatar1_small.jpg )
Rails.application.config.assets.precompile += %w( layout.js )
Rails.application.config.assets.precompile += %w( layout.scss )
Rails.application.config.assets.precompile += %w( testing.js )
Rails.application.config.assets.precompile += %w( testing.scss )
  
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
