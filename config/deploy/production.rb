set :stage, :production
user = 'mikami'
ipaddress = '153.126.176.236'
role :app, %W{#{user}@#{ipaddress}}
role :web, %W{#{user}@#{ipaddress}}
role :db, %W{#{user}@#{ipaddress}}

server ipaddress,
user: user,
roles: %w{web app db},
ssh_options: {
  keys: %w(~/.ssh/id_rsa),
  forward_agent: true,
},
port: 56781
# set :unicorn_pid, "/var/www/app/#{fetch(:application)}/shared/tmp/pids/unicorn.pid"
# set :stage, :production # これいらないかも。
# set :unicorn_rack_env, 'production'
# set :unicorn_config_path, "/var/www/app/#{fetch(:application)}/current/config/unicorn.rb"
# set :rails_env, 'production'
# set :branch, 'master'
