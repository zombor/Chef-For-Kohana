# Vagrant Chef Recipes For Kohana

This is a repo for "one-click-setup" for local hosting your kohana app using [vagrant](http://vagrantup.com/).

## Install

 1. Sub-module this repo into your `cookbooks/` directory.
 2. Symlink `cookbooks/Vagrantfile` to `Vagrantfile`
 3. `vagrant up`
 4. Add `127.0.0.1	www.local-kohana.com` to your /etc/hosts file

This will give you a fully usable virtual machine that you can access via `http://www.local-kohana.com/`.

The vagrant file assumes you are using [minion](https://github.com/kohana-minion) for your migrations, and will automatically migrate your database up.

## Features

Here's the list of currently installed software:

 - Ubuntu Server 10.04 Lucid
 - Apache 2.2.x
 - php 5.3.x
   - php5-mysql
   - php5-memcache
   - php5-gd
   - php-pear
   - php5-xdebug
 - MySQL 5.2.x

### Contributing

Think you can help? Fork this repo and send me a pull request.

## Database Configuration

To get your app to work with this setup, you'll need this database config:

	'default' => array
	(
		'type'       => 'mysql',
		'connection' => array(
			'hostname'   => 'localhost',
			'database'   => 'kohana_local',
			'username'   => 'root',
			'password'   => 'root',
			'persistent' => FALSE,
		),
		'table_prefix' => '',
		'charset'      => 'utf8',
		'caching'      => FALSE,
		'profiling'    => TRUE,
	),