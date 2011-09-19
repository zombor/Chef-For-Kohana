#
# Cookbook Name:: behat
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

php_pear_channel "pear.symfony.com" do
  action :discover
end

php_pear "behat" do
    action :upgrade
end

php_pear "mink" do
    action :upgrade
end