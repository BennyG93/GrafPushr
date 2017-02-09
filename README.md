# Grafana Dashboard Pusher

Store JSON Dashboard config in ./tmeplates

##### Examples:
- Listing all Grafana Dashboards
```sh
$ ./GrafPushr.rb -o list -u h1grf01-v01.devops.stg2.ovp.bskyb.com -d all
Listing all dashboards:
Database Performance - db/database-performance
System Healthcheck - db/system-healthcheck
```

- Adding a Dashboard to Grafana
```sh
$ ./GrafPushr.rb -o add -u h1grf01-v01.devops.stg2.ovp.bskyb.com -d system-healthcheck
ADDING Dashboard
{"slug":"system-healthcheck","status":"success","version":0}
```

- Deleting a Dashboard from Grafana
```sh
$ ./GrafPushr.rb -o delete -u h1grf01-v01.devops.stg2.ovp.bskyb.com -d system-healthcheck
DELETED Dashboard:
{"title":"System Healthcheck"}
```

##### Usage:
```sh
$ ./GrafPushr.rb -h
	The Dashboard Pusher is a simple Ruby wrapper for the Grafana API.
	It is only desinged for Dashboards and has 3 functions LIST, ADD, DELETE.

	Example:
	$ ./GrafPushr.rb -o list -u h1grf01-v01.devops.stg2.ovp.bskyb.com -d system-healthcheck

	Usage:
		ruby api_tool.rb [options]
	where [options] are:
  -o, --option=<s>       LIST, ADD, DELETE
  -u, --url=<s>          Grafana URL
  -d, --dashboard=<s>    Name of Dashboard JSON file saved in ./files
  -v, --version          Print version and exit
  -h, --help             Show this message
```

##### Testing:
RSPEC tests have been written which will test the HTTP calls and stub the responses

Tests are invoked using `rake`

```sh
$ rake -T
rake spec  # Run all tests for this tool
```

```sh
rake spec

External request
  queries Grafana LIST all Dashboards API service
  queries Grafana ADD Dashboards API service
  queries Grafana DELTE Dashboards API service

Finished in 0.01331 seconds (files took 0.37656 seconds to load)
3 examples, 0 failures
```