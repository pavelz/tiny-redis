require "tiny/redis/railtie"
require 'redis'
require 'connection_pool'

module Tiny
  module Redis

    def self.included(klass)
      klass.extend(ClassMethods)
    end

    def save(filter)
      key, crypt = self.class.setup(index)

      $redis.with do |r|
        r.set(key, crypt.encrypt_and_sign(self.to_json(except: filter)))
      end
    end

    module ClassMethods
      def load(index)
        key, crypt = setup(index)

        $redis.with do |r|
          encrypted = r.get(key)
          return nil if encrypted.nil?
          JSON.parse(crypt.decrypt_and_verify(encrypted), object_class: self)
        end
      end

      def setup(index)
        key = Digest::SHA1.hexdigest(index)
        encrypt_key = Rails.application.credentials.user[:encryptkey]
        crypt = ActiveSupport::MessageEncryptor.new(encrypt_key)
        return [key, crypt]
      end
    end

    attr_accessor   :errors
    def initialize(params = {})
      @errors = ActiveModel::Errors.new(self)

      params.present? && params.each do |k,v|
        self[k] = v
      end
    end

    def []=(key, value)
      return if key == 'errors' # PATCH if error sneaks in, ruins whole validation process
      send("#{key}=", value)
    end
  end
end
