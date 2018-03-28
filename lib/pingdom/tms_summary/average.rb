module Pingdom
  class TMSSummary
    # summary.average includeuptime
    # {
    #   "responsetime"=>{
    #     "#"=>[
    #       {"avgresponse"=>994},
    #       {"avgresponse"=>6}
    #     ],
    #     "avgresponse"=>1000,"from"=>0, "to"=>1500000000
    #   },
    #   "status"=>{"totalup"=>5035757, "totalunknown"=>1293069551, "totaldown"=>5078}
    # }
    class Average < Base
      class Ingredient < Base
        def self.parse(client, response)
          sum = response.dup
          sum["responsetime"] = sum.delete("avgresponse")
          new client, sum
        end

        attributes responsetime: :response_time
      end

      def self.parse(client, response)
        body = super["summary"]
        sum = body["responsetime"]

        sum["status"] = Status.new(client, response, body["status"]) if body.key?("status")

        sum["responsetime"] = sum.delete("avgresponse")

        new(client, response, sum)
      end

      def ingredients
        @attributes["#"].map { |ingredient| Ingredient.new @client, ingredient }
      end
      alias_method :per_ingredient, :ingredients

      attributes responsetime: :response_time
    end
  end
end
