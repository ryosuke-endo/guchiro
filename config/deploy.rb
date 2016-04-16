# config valid only for current version of Capistrano
lock '3.4.1'

set :application, 'guchiro'
set :repo_url, 'git@github.com:ryosuke-endo/guchiro.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, 'master'
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/app/guchiro'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, true

set :bundle_binstubs, nil
# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
set :default_env, { path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH"}

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do
  after :finishing, 'deploy:cleanup'
  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     # Here we can do anything such as:
  #     # within release_path do
  #     #   execute :rake, 'cache:clear'
  #     # end
  #   end
  # end

end
