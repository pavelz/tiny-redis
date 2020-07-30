### tiny-redis

Tiny Redis - encrypted barebones JSON formatted orm.
Encryption is Rails Credentials based.

Steps to use:
```
   add to Gemfile:
   gem 'tiny-redis'

   bundle install

   rails g tiny_redis

   this will install initalizer that creates a pool of redis connections
```

## How to use

```
   class User
   include Tiny::Redis

   attr_accessor :email
   alias_method :index, :email # this will tie your records method to indexing parameter
   end
```
Set up credentials:
```
   rails credentials:edit --environment development

   add:
   user:
     encryptkey: abcdabcdabcdadbvabcdabcdabcdadbv
```
##Env Vars
```
   RAILS_MAX_CONCURRENCY - how many connections will be created to redis server
   REDIS_TIMEOUT - timeout for operations
   REDIS_URL - url for redis server.
```

Now your records in redis are encrypted. If you wish for more security you can remove config/master.key after server starts. And investigate SE Linux address space protection so hacker can't pry encryption key from the app so easily.

Have fun! 🎉
