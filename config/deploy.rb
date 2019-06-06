# config valid only for current version of Capistrano
lock "~> 3.11.0"

set :application, 'freemarket_sample_51b'
set :repo_url,  'git@github.com:kosukekomuro/freemarket_sample_51b.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/keypair.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

set :default_env, {
    rbenv_root: "/usr/local/rbenv",
    path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH",
    AWS_ACCESS_KEY_ID: ENV["AWS_ACCESS_KEY_ID"],
    AWS_SECRET_ACCESS_KEY: ENV["AWS_SECRET_ACCESS_KEY"],
    BASIC_AUTH_USER: ENV["BASIC_AUTH_USER"],
    BASIC_AUTH_PASSWORD: ENV["BASIC_AUTH_PASSWORD"]
    PAYJP_PUBLIC_KEY: ENV["PAYJP_PUBLIC_KEY"],
    PAYJP_SECRET_KEY: ENV["PAYJP_SECRET_KEY"]
  }

set :linked_files, %w{ config/secrets.yml }

set :unicorn_stop_sleep_time, 3

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:stop'
    execute :sleep, fetch(:unicorn_stop_sleep_time)
    invoke 'unicorn:start'
  end

  desc 'upload secrets.yml'
  task :upload do
    on roles(:app) do |host|
      if test "[ ! -d #{shared_path}/config ]"
        execute "mkdir -p #{shared_path}/config"
      end
      upload!('config/secrets.yml', "#{shared_path}/config/secrets.yml")
    end
  end
  before :starting, 'deploy:upload'
  after :finishing, 'deploy:cleanup'
end