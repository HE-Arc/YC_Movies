# config valid only for current version of Capistrano
lock "3.8.0"

set :application, "app"
set :repo_url, "https://github.com/HE-Arc/YC_Movies.git"



# Default branch is :master
# set branch to "front-end"
#set :branch, `git rev-parse --abbrev-ref front_end`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/home/matthieu/www/app"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
#append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')


# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5



#namespace :deploy do
#  after :finished, :restart_puma do
#    on roles(:web) do
#      execute :sudo, 'service puma-matthieu restart'
#      execute :sudo, 'service nginx reload'
#    end
#  end
#end

# source the environment variable
#prefix = 'source ~/.bash_profile;'
#[:bundle, :rake, :rails].each do |cmd|
#  SSHKit.config.command_map.prefix[cmd].push(prefix)
#end

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      #within release_path do
      #  execute :rake, 'cache:clear'
      #end
    end
  end

  after :finished, :restart_puma do
    on roles(:web) do
      sudo "sv restart puma"
	  sudo "sv reload nginx"
      #execute :touch, "#{fetch(:deploy_to)}/shared/tmp/restart.txt"
    end
  end

end

# Source the environment variable beforehand.
prefix = 'source ~/.bash_profile;'
[:bundle, :rake, :rails].each do |cmd|
  SSHKit.config.command_map.prefix[cmd].push(prefix)
end




