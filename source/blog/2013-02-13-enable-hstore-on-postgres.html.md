---
title: "Enable hstore on postgres"
published: true
tags: Coding
active_page: blog
---
If you want to use the cool hstore feature which postgres provides you need to create the necessary extension for it.

First we need to install the contrib package

``` sh
sudo apt-get install postgresql-contrib
```

After that we must open psql with

``` sh
sudo -u postgres psql *your-db-with-hstore*
```

And then we can create the hstore extension with

``` sh
CREATE EXTENSION IF NOT EXISTS hstore;
```
