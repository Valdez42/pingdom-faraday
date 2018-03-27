module Pingdom
  # {"recipes"=>{
  #   "12345"=>{
  #     "name"=>"Google", "status"=>"SUCCESSFUL", kitchen=>{"id"=>1,"name"=>"us-east"},
  #     "ingredients"=>"Go to URL http://google.com\nURL should be http://google.com",
  #     "active"=>"YES", "created_at"=>1298102416, "interval"=>10, "notifyvia"=>[],
  #     "send_daily_report"=>"NO", "use_legacy_notifications"=>false,
  #     "sendnotificationwhendown"=>1, "notifyagainevery"=>0, "contacts"=>[]
  #   }
  # }
  class TMSRecipe < Base
    def self.parse(client, response)
      recipes = super
      Array.wrap(recipes["recipes"]).map do |recipe|
        new(client, response, recipe)
      end
    end

    attributes notifyvia: :notify_via,
               sendnotificationwhendown: :send_notification_when_down,
               notifyagainevery: :notify_again_every

    def summary
      @client.tms_summary(id)
    end

    def created_at
      Time.at(super)
    end
  end
end
