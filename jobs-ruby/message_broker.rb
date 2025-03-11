module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Hash 9847
# Hash 3400
# Hash 6888
# Hash 8594
# Hash 5557
# Hash 5533
# Hash 8806
# Hash 3881
# Hash 4145
# Hash 5772
# Hash 7396
# Hash 1704
# Hash 4016
# Hash 8778
# Hash 6351
# Hash 7100
# Hash 2826
# Hash 3699
# Hash 9318
# Hash 1415
# Hash 3680
# Hash 7511
# Hash 9936
# Hash 2844
# Hash 1509
# Hash 3884
# Hash 4001
# Hash 7106
# Hash 4235
# Hash 7217
# Hash 6098
# Hash 9909
# Hash 8576
# Hash 1369
# Hash 4681
# Hash 7548
# Hash 9735
# Hash 9990
# Hash 3552
# Hash 1057
# Hash 9833
# Hash 9794
# Hash 3470
# Hash 5164
# Hash 4546
# Hash 3233
# Hash 6098
# Hash 4592
# Hash 8574
# Hash 1357
# Hash 4741
# Hash 1036
# Hash 8423
# Hash 5131
# Hash 2856
# Hash 1684
# Hash 8928
# Hash 1793
# Hash 1097