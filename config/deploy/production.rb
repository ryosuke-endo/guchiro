set :port, 56781
set :user, 'mikami'
set :deploy_via, :remote_cache
set :use_sudo, false

server '153.126.176.236',
  roles: %w{ web app db },
  port: fetch(:port),
  user: fetch(:user),
  primary: true

set :deploy_to, "/var/www/app/guchiro"

set :ssh_options, {
  keys: %w(~/.ssh/id_rsa),
  forward_agent: true,
}

set :rails_env, :production
set :conditionally_migrate, true
