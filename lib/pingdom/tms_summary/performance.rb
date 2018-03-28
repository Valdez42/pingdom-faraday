module Pingdom
  class TMSSummary
    # summary.performance includeuptime resolution=day
    # {"days"=>[
    #   {
    #     "#"=>[
    #       {"avgresponse"=>994,"command"=>"Go to URL http://google.com"},
    #       {"avgresponse"=>6,"command"=>"URL should be http://google.com"}
    #     ],
    #     "avgresponse"=>1000,"downtime"=>0,"starttime"=>1500000000,"unmonitored"=>0,
    #     "uptime"=>86400,"revision"=>12345
    #   }
    # ]}
    class Performance < Base
      class Ingredient < Base
        def self.parse(client, response)
          new(client, response, response)
        end

        attributes avgresponse: :response_time
      end

      INTERVALS = {
        "hour"  => 1.hour,
        "day"   => 1.day,
        "week"  => 1.week,
      }.freeze

      def self.parse(client, response)
        body      = super["summary"]
        interval  = body.keys.detect { |k| INTERVALS.keys.include?(k.chomp("s").to_s) }.chomp("s").to_sym
        intervals = body[interval.to_s.pluralize]

        intervals.map do |perf|
          perf["interval"] = interval
          new(client, response, perf)
        end
      end

      def ingredients
        @attributes["#"].map { |ingredient| Ingredient.new @client, ingredient }
      end
      alias_method :per_ingredient, :ingredients

      def starttime
        Time.at(@attributes["starttime"])
      end
      alias_method :start_at, :starttime

      def endtime
        starttime + INTERVALS[interval.to_s].to_i
      end
      alias_method :end_at, :endtime

      def uptime
        @attributes["uptime"].seconds
      end

      def downtime
        @attributes["downtime"].seconds
      end

      def unmonitored
        @attributes["unmonitored"].seconds
      end

      def monitored
        uptime + downtime
      end

      def period
        monitored + unmonitored
      end

      attributes avgresponse: :response_time
    end
  end
end
