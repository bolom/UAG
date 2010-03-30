set :application, "uag-histoire.com"

#Git Config

set :repository,  "git@github.com:bolom/UAG.git"
set :scm, "git"
set :branch, "master"
set :repository_cache, "git_cache"

set :user, "root"
set :deploy_via, :remote_cache
set :ssh_options, { :forward_agent => true }

set :deploy_to, "/var/www/vhosts/#{application}/"
set :backup_dir, "#{deploy_to}/backup"                                         
server "70.32.75.184", :web, :app, :db, :primary => true      

namespace :deploy do 
  
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  [:stop, :start].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
  
end

after "deploy:start" do
  run "chown -R bolo #{deploy_to}"
  run "chgrp -R psaserv #{deploy_to}"
  run "chmod -R 775 #{deploy_to}"
end

after "deploy:default" do
  cleanup
end

after "deploy:setup" do
  run "mkdir #{shared_path}/system/pictures"
end

after "deploy:update_code" do
  run "ln -fs #{shared_path}/config/database.yml #{release_path}/config/"
  run "ln -fs #{shared_path}/upload #{release_path}/public/"
  run "chmod -R 775 #{release_path}/temp"
  
end

Dir[File.join(File.dirname(__FILE__), '..', 'vendor', 'gems', 'hoptoad_notifier-*')].each do |vendored_notifier|
  $: << File.join(vendored_notifier, 'lib')
end

require 'hoptoad_notifier/capistrano'