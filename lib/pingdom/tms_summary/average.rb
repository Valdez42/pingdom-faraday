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
      def self.parse(client, response)
      end

      attributes responsetime: :response_time
    end
  end
end
