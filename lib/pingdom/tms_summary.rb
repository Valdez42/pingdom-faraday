module Pingdom
  class TMSSummary < Base
    class Proxy < Struct.new(:client, :id)
      def average(options = {})
        options.reverse_merge!(includeuptime: true)
        Average.parse(client, client.get("tms.summary.average/#{id}", options))
      end
      alias_method :averages, :average

      def outage(options = {})
        options.reverse_merge!(includeuptime: true)
        Outage.parse(client, client.get("tms.summary.outage/#{id}", options))
      end
      alias_method :outages, :outage

      def performance(options = {})
        options.reverse_merge!(resolution: :day, includeuptime: true)
        Performance.parse(client, client.get("tms.summary.performance/#{id}", options))
      end
    end

    def self.proxy(client, recipe)
      Proxy.new(client, recipe)
    end

    def from
      Time.at(@attributes[:from])
    end

    def to
      Time.at(@attributes[:to])
    end

    attributes responsetime: :response_time

    # {"status"=>{"totalup"=>5035757, "totalunknown"=>1293069551, "totaldown"=>5078}}
    class Status < Base
    end
  end
end
