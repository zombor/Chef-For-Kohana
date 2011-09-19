# Vagrant Chef Recipes For Kohana

This is a repo for "one-click-setup" for local hosting your kohana app using [vagrant](http://vagrantup.com/).

## Install

 1. Sub-module this repo into your `cookbooks/` directory.
 2. symlink `cookbooks/Vagrantfile` to `Vagrantfile`
 3. `vagrant up`

This will give you a fully usable virtual machine that you can access via `http://www.local-kohana.com/`.

The vagrant file assumes you are using [minion](https://github.com/kohana-minion) for your migrations, and will automatically migrate your database up.

## Features

Here's the list of currently installed software:

 - Ubuntu Server 10.04 Lucid
 - Apache 2.2.x
 - php 5.3.x
 - MySQL 5.2.x

### Contributing

Think you can help? Fork this repo and send me a pull request.