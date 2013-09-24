set :rvm_ruby_string, ENV['GEM_HOME'].gsub(/.*\//,"")
require "rvm/capistrano"
require "bundler/capistrano"
require "delayed/recipes"
load "deploy/assets"
set :rvm_type, :system
set :rvm_path, "/usr/local/rvm"

default_run_options[:pty] = true
set :application, "crm_personal_account"
set :repository,  "git@github.com:Supro/crm_personal_account.git"

set :scm, :git
set :user, "root"
set :use_sudo, false

set :branch, "master"
set :deploy_via, :remote_cache
set :keep_releases, 3
set :deploy_to, "/var/www/apps/#{application}"
set :rails_env, "production"
set :domain, "194.54.152.23"
set :scm_command, "/usr/bin/git"
set :scm_verbose, true
set :normalize_asset_timestamps, false

role :web, domain                         
role :app, domain                         
role :db,  domain, primary: true

ssh_options[:forward_agent] = true
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")]

after "deploy", "delayed_job:restart"