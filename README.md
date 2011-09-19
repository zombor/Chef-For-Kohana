# Vagrant Chef Recipes For Kohana

This is a repo for "one-click-setup" for local hosting your kohana app using [vagrant](http://vagrantup.com/).

## Install

 1. Sub-module this repo into your `cookbooks/` directory.
 2. symlink `cookbooks/Vagrantfile` to `Vagrantfile`
 3. `vagrant-up`

This will give you a fully usable virtual machine that you can access via `http://www.local-kohana.com/`.

The vagrant file assumes you are using `minion` for your migrations, and will automatically migrate your database up.