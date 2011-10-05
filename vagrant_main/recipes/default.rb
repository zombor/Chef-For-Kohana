require_recipe "apt"
require_recipe "apache2"
require_recipe "mysql::server"
require_recipe "php"
require_recipe "php::module_curl"
require_recipe "php::module_mysql"
require_recipe "phpunit"

# Some neat package (subversion is needed for "subversion" chef ressource)
%w{ debconf php5-xdebug }.each do |a_package|
  package a_package
end

s = "local-kohana"
site = {
  :name => s, 
  :host => "www.#{s}.com", 
  :aliases => ["#{s}.com", "dev.#{s}-static.com"]
}

# Configure the development site
web_app site[:name] do
  template "sites.conf.erb"
  server_name site[:host]
  server_aliases site[:aliases]
  docroot "/vagrant/docroot/"
end  

# Add site info in /etc/hosts
bash "info_in_etc_hosts" do
  code "echo 127.0.0.1 #{site[:host]} #{site[:aliases]} >> /etc/hosts"
end

# Add an admin user to mysql
execute "add-admin-user" do
  command "/usr/bin/mysql -u root -p#{node[:mysql][:server_root_password]} -e \"" +
      "CREATE USER 'myadmin'@'localhost' IDENTIFIED BY 'myadmin';" +
      "GRANT ALL PRIVILEGES ON *.* TO 'myadmin'@'localhost' WITH GRANT OPTION;" +
      "CREATE USER 'myadmin'@'%' IDENTIFIED BY 'myadmin';" +
      "GRANT ALL PRIVILEGES ON *.* TO 'myadmin'@'%' WITH GRANT OPTION;\" " +
      "mysql"
  action :run
  ignore_failure true
end

# create default database
execute "add-db" do
  command "/usr/bin/mysql -u root -p#{node[:mysql][:server_root_password]} -e \"" +
      "CREATE DATABASE kohana_local;\" " +
      "mysql"
  action :run
  ignore_failure true
end

# migrate
execute "migrate" do
  command "cd /vagrant && ./minion migrations:run"
  action :run
  ignore_failure true
end