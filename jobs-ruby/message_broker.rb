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
# Hash 8892
# Hash 2375
# Hash 4107
# Hash 8114
# Hash 8998
# Hash 4837
# Hash 5089
# Hash 7504
# Hash 7865
# Hash 4081
# Hash 9029
# Hash 3174
# Hash 6178
# Hash 7814
# Hash 9361
# Hash 6247
# Hash 2875
# Hash 6105
# Hash 4165
# Hash 6683
# Hash 9117
# Hash 9653
# Hash 5366
# Hash 7091
# Hash 7209
# Hash 1550
# Hash 9585
# Hash 6457
# Hash 6751
# Hash 3956
# Hash 3019
# Hash 7498
# Hash 5929
# Hash 7434
# Hash 6384
# Hash 5999
# Hash 9301
# Hash 2607
# Hash 7953
# Hash 9782
# Hash 9401
# Hash 4527
# Hash 3237
# Hash 5960
# Hash 1180
# Hash 8549
# Hash 8895
# Hash 4899
# Hash 9686
# Hash 1078
# Hash 9319
# Hash 7604
# Hash 3778
# Hash 3918
# Hash 2596
# Hash 8500
# Hash 8507
# Hash 7740
# Hash 6947
# Hash 7771
# Hash 7801
# Hash 8717
# Hash 9639
# Hash 9834
# Hash 9077
# Hash 4908
# Hash 9555
# Hash 2565
# Hash 5533
# Hash 8872
# Hash 3359
# Hash 8046
# Hash 7557
# Hash 9853
# Hash 7903
# Hash 5131
# Hash 2189
# Hash 4936
# Hash 2377
# Hash 7459
# Hash 7246
# Hash 8756
# Hash 8225
# Hash 3058
# Hash 8535
# Hash 1962
# Hash 3236
# Hash 6335
# Hash 9149
# Hash 2215
# Hash 9394
# Hash 2184
# Hash 5671
# Hash 4584
# Hash 8015
# Hash 9652
# Hash 6965
# Hash 5274
# Hash 4533
# Hash 4765
# Hash 5957
# Hash 5293
# Hash 8907
# Hash 3935
# Hash 3636
# Hash 4363
# Hash 4222
# Hash 1728
# Hash 3348
# Hash 3112
# Hash 6463
# Hash 3983