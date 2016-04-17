# config valid only for current version of Capistrano
lock '3.4.1'

set :application, 'guchiro'
set :repo_url, 'https://github.com/ryosuke-endo/guchiro.git'
set :rbenv_type, :user
set :rbenv_ruby, '2.2.3'
set :deploy_to, "/var/www/app/#{fetch(:application)}"

shared_path = "#{fetch(:deploy_to)}/shared"
release_path = "#{fetch(:deploy_to)}/current"

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :keep_releases, 10

set :unicorn_pid, "#{shared_path}/tmp/pids/unicorn.pid"
set :unicorn_config_path, "#{release_path}/config/unicorn.rb"

set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, true

# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for default_env is {}
# set :default_env, { path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH"}

set :ssh_options, {
  user: 'mikami',
  keys: %w(~/.ssh/id_rsa),
  forward_agent: false,
  auth_methods: %w(publickey)
}

# test connection
task :list do
  on roles(:app), in: :sequence do
    execute 'ls -la'
  end
end

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
