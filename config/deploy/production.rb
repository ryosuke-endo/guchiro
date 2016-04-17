server '153.126.176.236',
  user: 'mikami',
  roles: %w{web app},
  ssh_options: {
    user: 'mikami',
    keys: %w(~/.ssh/id_rsa),
    forward_agent: false,
    auth_methods: %w(publickey)
  },
  port: 56781

set :unicorn_pid, "/var/www/app/#{fetch(:application)}/shared/tmp/pids/unicorn.pid"
set :stage, :production # これいらないかも。
set :unicorn_rack_env, 'production'
set :unicorn_config_path, "/var/www/app/#{fetch(:application)}/current/config/unicorn/production.rb"
set :rails_env, 'production'
set :branch, 'master'
