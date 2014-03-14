require 'dotenv'
Dotenv.load

app_root = ENV['SHORT_LINKS_PATH']

config = {
  min_threads_count: 2,
  max_threads_count: 2,
  workers_count: 1,
  env: 'production'
}

threads config[:min_threads_count].to_i, config[:max_threads_count].to_i
workers config[:workers_count].to_i
bind "unix://#{File.join(app_root, 'tmp/sockets/puma.sock')}"
environment config[:env]

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

preload_app!
