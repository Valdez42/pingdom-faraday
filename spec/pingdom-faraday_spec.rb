require "spec_helper"

describe Pingdom::Client do
  let(:client) { Pingdom::Client.new(CREDENTIALS.merge(logger: LOGGER)) }

  describe "#test!" do
    it "should test a single endpoint" do
      response = client.test!(host: "pingdom.com", type: "http")
      expect(response.status).to eq("up")
      expect(response.responsetime).to be_a(Numeric)
    end
  end

  describe "#checks" do
    it "should get a list of checks" do
      checks = client.checks

      first = checks.first
      expect(first).to be_a(Pingdom::Check)
      expect(first.last_response_time).to be_a(Numeric)
    end
  end

  describe "#limit" do
    { short: "short term",
      long: "long term" }.each do |(key, label)|
      describe label do
        let(:limit) do
          client.test!(host: "pingdom.com", type: "http")
          client.limit[key]
        end

        it "should indicate how many requests can be made" do
          expect(limit[:remaining]).to be_a(Numeric)
        end

        it "should indicate when the current limit will be reset" do
          expect(limit[:resets_at].acts_like?(:time)).to be_truthy
        end
      end
    end
  end
end
