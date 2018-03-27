# Pingdom RESTful API Client

Pingdom RESTful API wrapper for Ruby.

NOTE: This is a 3rd party gem and not an official product from Pingdom.

## Usage

```ruby
client = Pingdom::Client.new :username => u, :password => p, :key => k
check = client.checks.first #=> #<Pingdom::Check>
check.last_response_time    #=> 200 (ms)
check.status                #=> "up"

result = check.results.first(:probes => [1,2,3], :status => [:up, :down])
                            #=> #<Pingdom::Result>
result.status               #=> :up
result.up?                  #=> true
result.response_time        #=> 20000 (ms)

avg = check.summary.average(:from   => 1.month.ago,
                            :probes => [1,2,3])
                            #=> #<Pingdom::Summary::Average>
avg.response_time           #=> 200 (ms)
probe_avg = avg.averages.first
probe_avg.response_time     #=> 120 (ms)
probe_avg.probe.name        #=> "Atlanta, GA"
```

## Testing

Create a `credentials.yml` file in the gem's base directory containing your Pingdom credentials:

```yaml
username: u
password: p
key: k
```

Run tests with `bundle exec rake`.

## Contributors

* Transaction check (TMS) support by [Hund.io](https://github.com/hundio)
* Updated for Ruby 1.9.x/2.0.0 by Jason Straughan ([jdstraughan](https://github.com/jdstraughan))
* Emily Price ([duien](https://github.com/duien))
* Based on [pingom-client](https://github.com/mtodd/pingdom-client) by [Matt Todd](https://github.com/mtodd)
