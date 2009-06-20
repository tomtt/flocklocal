set :application, "flocklocal"
set :repository,  "."

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

set :user, "localflock"
set :deploy_to, "/websites/www/#{application}"
set :use_sudo, false

# set :repository, "/git"
ssh_options[:forward_agent] = true
set :scm, :git
set :scm_verbose, true # due to git 1.4 being used on server
set :branch, "master"
set :deploy_via, :remote_cache

set :copy_remote_dir, "/home/#{user}"

set :host, "flocklocal.net"
role :app, host
role :web, host
role :db,  host, :primary => true

after "deploy:update_code", "config:copy_shared_configurations"

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end

# Configuration Tasks
namespace :config do
  desc "copy shared configurations to current"
  task :copy_shared_configurations, :roles => [:app] do
    %w[database.yml].each do |f|
      run "ln -nsf #{shared_path}/config/#{f} #{release_path}/config/#{f}"
    end
  end
end
