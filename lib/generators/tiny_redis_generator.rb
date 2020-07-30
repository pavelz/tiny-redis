class TinyRedisGenerator < Rails::Generators::Base
  def create_tiny_redis_file
    create_file "config/initializers/tiny-redis.rb", <<EOD
if Rails.env.test?
  $redis = ConnectionPool::Wrapper.new(size: 5, timeout: 3) { Redis.new(url: 'redis://127.0.0.1:6379/2') }
  $redis.flushall
else
  $redis = ConnectionPool::Wrapper.new(size: 5, timeout: 3) { Redis.new(url: 'redis://127.0.0.1:6379/1') }
end
EOD
  end
end
