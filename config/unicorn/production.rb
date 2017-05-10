# Set your full path to application.
deploy_to = '/var/www/beauty'
app_path = "#{deploy_to}/current"

# Set unicorn options
worker_processes 2
preload_app true
timeout 60
listen "#{deploy_to}/shared/unicorn.sock"

# Spawn unicorn master worker for user apps (group: apps)
user 'deploy', 'deploy' 

preload_app true

# Fill path to your app
working_directory app_path

# Should be 'production' by default, otherwise use other env 
# rails_env 'production'

# Log everything to one file
stderr_path '/var/www/beauty/shared/log/production.log'
stdout_path '/var/www/beauty/shared/log/production.log'

# Set master PID location
pid "#{deploy_to}/shared/unicorn.pid"

before_fork do |server, worker|
  ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection
end
