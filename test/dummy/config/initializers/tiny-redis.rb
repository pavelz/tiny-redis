if Rails.env.test?
  $redis = ConnectionPool::Wrapper.new(size: 5, timeout: 3) { Redis.new(url: 'redis://127.0.0.1:6379/2') }
  $redis.flushall
else
  $redis = ConnectionPool::Wrapper.new(size: 5, timeout: 3) { Redis.new(url: 'redis://127.0.0.1:6379/1') }
end
