module Pingdom
  class TMSSummary
    # summary.outage
    # {"states"=>[
    #   {"actual_timefrom"=>1500000005,"revision"=>12345,"status"=>"up",
    #    "timefrom"=>0,"timeto"=>1500005000}
    # ]}
    class Outage < Base
      def self.parse(client, response)
        super["summary"]["states"].select { |s| s["status"] == "down" }.
          map do |outage|
          new(client, response, outage)
        end
      end

      def downtime
        (@attributes["timeto"] - @attributes["timefrom"]).seconds
      end

      def timefrom
        Time.at(@attributes["timefrom"])
      end

      def timeto
        Time.at(@attributes["timeto"])
      end

      def actual_timefrom
        Time.at(@attributes["actual_timefrom"])
      end

      attributes timefrom: [:time_from, :from],
                 timeto: [:time_to, :to],
                 actual_timefrom: [:actual_time_from, :actual_from]
    end
  end
end
