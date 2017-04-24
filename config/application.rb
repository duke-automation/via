require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

Slim::Engine.set_options :pretty => true, :sort_attrs => false

module Via
  class Application < Rails::Application

    config.active_record.raise_in_transactional_callbacks = true

    config.assets.initialize_on_precompile = false

    config.serve_static_files = true

    config.autoload_paths += %W(#{config.root}/lib)

    config.time_zone = 'Eastern Time (US & Canada)'

    config.encoding = "utf-8"

    config.filter_parameters += [:password]

    config.active_support.escape_html_entities_in_json = true

    config.assets.enabled = true

    config.assets.version = '1.0'

    config.action_controller.action_on_unpermitted_parameters = :raise
  end
end
