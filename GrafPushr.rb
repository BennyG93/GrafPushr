#!/usr/bin/env ruby
require 'trollop'
require 'rest-client'
require 'json'

class DashboardPushr
	# Username and Password to authenticate against Grafana
	@@username = '[username]'
	@@password = '[password]'

	def get_template(dashboard)
		# Open a given template JSON file to be passed into add_dashboard method
		return File.read("templates/#{dashboard}.json")
	end

	def list_dashboards (url)
		request = RestClient::Request.execute(:url => "http://#{@@username}:#{@@password}@#{url}/api/search", :method => :get)
		# Parsing JSON to be manipulated.
		response = JSON.parse(request)
		# Iterate over each block of JSON in the response and print out the Dashboard Title
		response.each do |dashboard|
			puts "#{dashboard['title']} - #{dashboard['uri']}"
		end
	end

	def add_dashboard (url, dashboard)
		# Using the method above to pull in the template JSON file
		template = get_template(dashboard)
		request = RestClient::Request.execute(:url => "http://#{@@username}:#{@@password}@#{url}/api/dashboards/db", :method => :post, :payload => template, headers: {:content_type => 'application/json'})
		return request
	end

	def delete_dashboard (url, dashboard)
		request = RestClient::Request.execute(:url => "http://#{@@username}:#{@@password}@#{url}/api/dashboards/db/#{dashboard}", :method => :delete)
		return request
	end
end

opts = Trollop::options do
	version "Grafana Dashboard Pusher 0.1 - Ben Groves <benjamin.groves@sky.uk>"
	banner <<-EOS
	The Dashboard Pusher is a simple Ruby wrapper for the Grafana API.
	It is only desinged for Dashboards and has 3 functions LIST, ADD, DELETE.

	Example:
	$ ./GrafPushr.rb -o list -u h1grf01-v01.devops.stg2.ovp.bskyb.com -d system-healthcheck

	Usage:
		ruby api_tool.rb [options]
	where [options] are:
	EOS
	opt :option, 'LIST, ADD, DELETE', :required => true, type: :string
	opt :url, 'Grafana URL', :required => true, type: :string
	opt :dashboard, 'Name of Dashboard JSON file saved in ./templates', :required => true, type: :string
end

object = DashboardPushr. new
cmd = opts[:option]
case cmd
	when 'ADD', 'add', 'a'
		puts 'ADDING Dashboard'
		puts object.add_dashboard(opts[:url], opts[:dashboard])
	when 'DELETE', 'delete', 'd'
		puts 'DELETED Dashboard:'
		puts object.delete_dashboard(opts[:url], opts[:dashboard])
	when 'LIST', 'list', 'l'
		puts 'Listing all dashboards:'
		object.list_dashboards(opts[:url])
	else
		puts 'Not a valid option'
end
