set :stage, :development
role :app, %w{root@153.126.176.236}
role :web, %w{root@$153.126.176.236}
role :db, %w{root@$153.126.176.236}

server '$153.126.176.236',
user: 'root',
roles: %w{web app db},
ssh_options: {
 auth_methods: %w(password),
 password: '********'
}
