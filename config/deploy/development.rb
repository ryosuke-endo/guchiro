set :stage, :development
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
  # auth_methods: %w(publickey)
  # password: '********'
},
port: 56781
