# Be more verbose by uncommenting the following line
logger.level = Logger::MAX_LEVEL

set :application, "backuper"

set :scm,         :git
set :repository,  "git@github.com:AppVentus/Backuper.git"
set :deploy_via,  :remote_cache

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :use_composer,   true
set :update_vendors, false
set :composer_options, "--verbose --prefer-dist --optimize-autoloader"

set :writable_dirs,     ["app/cache", "app/logs"]
set :webserver_user,    "www-data"
set :permission_method, :acl
set :use_set_permissions, true

set :shared_files,    ["app/config/parameters.yml"]
set :shared_children, ["app/logs", "app/sessions"]

set :dump_assetic_assets, true
set :model_manager, "doctrine"

set :use_sudo,    false
set :symfony_env, 'prod'
set :symfony_console, "app/console"

set :keep_releases, 3

set :domain,      "appventus.com"
set :deploy_to,   "/etc/backuper"
set :user,        "anakin"
set :branch,      "master"
set :deploy_via,  :remote_cache

role :web,        domain
role :app,        domain, :primary => true
role :db,         domain, :primary => true

after "deploy", "deploy:set_permissions"
after "deploy", "deploy:cleanup"
