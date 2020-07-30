class TinyRedisGenerator < Rails::Generators::Base
  def create_tiny_redis_file
    create_file "config/initializers/tiny-redis.rb", <<EOD
concurrency = ENV.fetch("RAILS_MAX_CONCURRENCY") {5}
timeout = ENV.fetch("REDIS_TIMEOUT") {1}

url = ENV.fetch("REDIS_URL"){
  if Rails.env.test?
    "redis://127.0.0.1:6379/2"
  else
    "redis://127.0.0.1:6379/1"
  end
}

if Rails.env.test?
  $redis = ConnectionPool::Wrapper.new(size: concurrency, timeout: timeout) { Redis.new(url: url )}
  $redis.flushall
else
  $redis = ConnectionPool::Wrapper.new(size: concurrency, timeout: timeout) { Redis.new(url: url )}
end
EOD
  end
end
