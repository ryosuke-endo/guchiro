# config valid only for current version of Capistrano
lock '3.4.1'

set :application, 'guchiro'
set :repo_url, 'https://github.com/ryosuke-endo/guchiro.git'
set :rbenv_type, :user
set :rbenv_ruby, '2.2.3'
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

set :use_sudo, false
set :bundle_binstubs, nil
set :linked_files, %w{ config/secrets.yml }
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  task :restart do
    invoke 'unicorn:reload'
  end
end
