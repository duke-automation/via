# Be sure to restart your server when you modify this file.
# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( boomerang-viahost.js )
Rails.application.config.assets.precompile += %w( boomerang-run-viahost.js )
Rails.application.config.assets.precompile += %w( boomerang-viahost-results.js )
Rails.application.config.assets.precompile += %w( images.js )
Rails.application.config.assets.precompile += %w( pagination.js )
Rails.application.config.assets.precompile += %w( chart.min.js )
Rails.application.config.assets.precompile += %w( chartkick.min.js )
Rails.application.config.assets.precompile += %w( c3.css )
Rails.application.config.assets.precompile += %w( chart.css )
Rails.application.config.assets.precompile += %w( images.css )
