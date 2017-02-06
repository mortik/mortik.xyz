---
title: "RoR Setup for Ubuntu"
published: true
tags: Coding
active_page: blog
---
This Blogpost gives you a slim checklist for your Ruby on Rails Setup for Ubuntu.

## Install Ubuntu
First we need a fresh Ubuntu Server minimal installation with openSSH, curl and git.
Select openSSH in the ubuntu setup and install curl and git with apt-get.

``` sh
sudo apt-get install curl git
```

## Public Keys
To make things easier you should add your public key to an authorized_keys file on your fresh installed ubuntu.
Your public key should be in your .ssh folder

``` sh
~.ssh/id_rsa.pub
```

If you dont have a public key you can generate one by typing

``` sh
ssh-keygen -t rsa
```

Append your public key in this file

``` sh
~.ssh/authorized_keys
```

Now you can login to your server without a password.

## New User
We start your setup by creating a new user for your project

``` sh
sudo adduser *username*
```

**Dont forget to add a save password!**

Now switch to your new user

``` sh
su *username*
```

and add your public key to this users authorized_keys file

## Install Requirements and Ruby
For **Ruby** on Rails you obviously need Ruby ;) so lets install RVM (Ruby Version Manager) first

``` sh
curl -L https://get.rvm.io | bash -s stable
```

to get rvm in your current shell type

``` sh
source ~/.rvm/scripts/rvm
```

now you should check the requirements for rvm with

``` sh
rvm requirements
```

install all of the needed requirements on your administrator or root user with

``` sh
# switch user
su administrator
sudo apt-get install *
```

Along with this step you should install some other requirements based on your Rails app:

Nginx, nodejs and supervisor

``` sh
sudo apt-get install nginx nodejs supervisor
```

MySql (optional, depends on your setup)

``` sh
sudo apt-get install mysql-server libmysql-ruby libmysqlclient-dev
```

ImageMagick (optional, for image resizing and more)

``` sh
sudo apt-get install imagemagick libmagickwand-dev
```

*But we wanted to install Ruby?* yes! back to your new user :)

``` sh
su *username*
```

if you need openssl install the package

``` sh
rvm pkg install openssl
```
and then the *latest* Ruby

``` sh
rvm install 1.9.3 --with-openssl-dir=$rvm_path/usr
```
or just install the *latest* Ruby

``` sh
rvm install 1.9.3
```
want to make your new Ruby version default your defualt ruby?

``` sh
rvm use 1.9.3 --default
```

## First Deploy

Now your server is basicly ready for your first deployment.

I will not describe how you should setup [capistrano](https://github.com/capistrano/capistrano/wiki) or [mina](http://nadarei.co/mina/), but you can read their documentation add the given links.

To setup supervisor for your Rails App you should checkout Raphael Randschaus Blogpost about [foreman and supervisord](https://github.com/nicolai86/nicolai86.github.com/blob/master/_posts/2012-02-25-foreman-and-supervisord.md)
