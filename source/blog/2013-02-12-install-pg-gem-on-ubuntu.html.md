---
title: "Install pg gem on Ubuntu"
published: true
tags: Coding
active_page: blog
---
Recently i had to deal with a strange error during deployment of one of my apps. The deploy crashed everytime at the installation of the pg gem as you can see in the log below:

``` sh
Building native extensions.  This could take a while...
ERROR:  Error installing pg:
  ERROR: Failed to build gem native extension.

        /home/reckoning/.rvm/rubies/ruby-1.9.3-p385/bin/ruby extconf.rb
checking for pg_config... yes
Using config values from /usr/bin/pg_config
checking for libpq-fe.h... yes
checking for libpq/libpq-fs.h... yes
checking for pg_config_manual.h... yes
checking for PQconnectdb() in -lpq... no
checking for PQconnectdb() in -llibpq... no
checking for PQconnectdb() in -lms/libpq... no
Can't find the PostgreSQL client library (libpq)
*** extconf.rb failed ***
Could not create Makefile due to some reason, probably lack of
necessary libraries and/or headers.  Check the mkmf.log file for more
details.  You may need configuration options.

Provided configuration options:
  --with-opt-dir
  --with-opt-include
  --without-opt-include=${opt-dir}/include
  --with-opt-lib
  --without-opt-lib=${opt-dir}/lib
  --with-make-prog
  --without-make-prog
  --srcdir=.
  --curdir
  --ruby=/home/reckoning/.rvm/rubies/ruby-1.9.3-p385/bin/ruby
  --with-pg
  --without-pg
  --with-pg-dir
  --without-pg-dir
  --with-pg-include
  --without-pg-include=${pg-dir}/include
  --with-pg-lib
  --without-pg-lib=${pg-dir}/lib
  --with-pg-config
  --without-pg-config
  --with-pg_config
  --without-pg_config
  --with-pqlib
  --without-pqlib
  --with-libpqlib
  --without-libpqlib
  --with-ms/libpqlib
  --without-ms/libpqlib


Gem files will remain installed in /home/reckoning/.rvm/gems/ruby-1.9.3-p385/gems/pg-0.14.1 for inspection.
Results logged to /home/reckoning/.rvm/gems/ruby-1.9.3-p385/gems/pg-0.14.1/ext/gem_make.out
```

As you can see he had a problem finding the required libpq (libpq-dev) libraries and therefore was unable to complete the bundle. Since i had already installed these libraries, i could not explain at first where the problem was.

```
Can't find the PostgreSQL client library (libpq)
```

I'm using rvm to install my rubies and there seems to be a problem with some dependencies from my local rvm and my global postgres installation.

I tried many solutions to fix this. From reinstalling postgres and his dev libraries to reinstalling ruby in my local rvm.

To make a long frustrating night short, the solution for my problem was to make a complete cleanout of my local rvm with

```
rvm implode
```

and then

```
curl -L https://get.rvm.io | bash -s stable --ruby
```

to reinstall the newest version.

After he compiled and installed the latest ruby (in my case 1.9.3-p385) i finally was able to install the pg gem.
