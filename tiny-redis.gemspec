$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "tiny/redis/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "tiny-redis"
  spec.version     = Tiny::Redis::VERSION
  spec.authors     = ["Pavel Zaitsev"]
  spec.email       = ["pavel@arslogi.ca"]
  spec.homepage    = "https://blog.arslogi.ca/"
  spec.summary     = "encrypted redis orm"
  spec.description = "Encrypted Redis ORM for rails, active record style"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.2"
  spec.add_dependency "redis", "~>4.2"
  spec.add_dependency "connection_pool", "~>2.2.3"
end
