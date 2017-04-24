# Load the Rails application.
require File.expand_path('../application', __FILE__)

unless ENV['RAILS_GROUPS'] =='assets'
  APP_CONFIG = YAML.load_file(Rails.root.join('config', 'via.yml'))[Rails.env].freeze
end

require 'resource_logger'

# Initialize the Rails application.
Rails.application.initialize!
