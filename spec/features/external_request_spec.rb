# spec/features/external_request_spec.rb
require 'spec_helper'

# This test handles the external HTTP calls that the dashboard pusher will make
describe 'External request' do
  it 'queries Grafana LIST all Dashboards API service' do
    uri = URI('http://h1grf01-v01.devops.int.ovp.bskyb.com/api/search')

    response = Net::HTTP.get(uri)
    expect(response).to be_an_instance_of(String)
  end

  it 'queries Grafana ADD Dashboards API service' do
    uri = URI('http://h1grf01-v01.devops.int.ovp.bskyb.com/api/dashboards/db')

    response = Net::HTTP.post_form(uri, 'dashboard' => 'test', 'id' => '50')
    expect(response)
  end

  it 'queries Grafana DELTE Dashboards API service' do
    uri = URI('http://h1grf01-v01.devops.int.ovp.bskyb.com/api/dashboards/db')

    # response = Net::HTTP::Delete.new(uri)
    response = Net::HTTP.new(uri).delete('/testdashboard')
    expect(response)
  end
end