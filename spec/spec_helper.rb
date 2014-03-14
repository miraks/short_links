ENV['RAILS_ENV'] ||= 'test'
ENV['REDIS_DB'] = '15'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/collection_matchers'
require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.after :each do
    Redis.current.flushdb
  end

  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"
end
