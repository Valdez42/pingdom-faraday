# Pingdom RESTful API Client

Pingdom RESTful API wrapper for Ruby.

NOTE: This is a 3rd party gem and not an official product from Pingdom.

## Usage

    client = Pingdom::Client.new :username => u, :password => p, :key => k
    check = client.checks.first #=> #<Pingdom::Check>
    check.last_response_time    #=> 200 (ms)
    check.status                #=> "up"

    result = check.results.first(:probes => [1,2,3], :status => [:up, :down])
                                #=> #<Pingdom::Result>
    result.status               #=> :up
    result.up?                  #=> true
    result.response_time        #=> 20000 (microsecs)

    avg = check.summary.average(:from   => 1.month.ago,
                                :probes => [1,2,3])
                                #=> #<Pingdom::Summary::Average>
    avg.response_time           #=> 200 (ms)
    probe_avg = avg.averages.first
    probe_avg.response_time     #=> 120 (ms)
    probe_avg.probe.name        #=> "Atlanta, GA"

## Contributors

* Updated for Ruby 1.9.x/2.0.0 by Jason Straughan ([jdstraughan](http://github.com/jdstraughan))
* Emily Price ([duien](http://github.com/duien))
* Based on [pingom-client](https://github.com/mtodd/pingdom-client) by [Matt Todd](https://github.com/mtodd)
