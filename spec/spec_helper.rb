require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, /h1grf01-v01.devops.int.ovp.bskyb.com/).
      with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: "stubbed response", headers: {})
  end

  config.before(:each) do
    stub_request(:post, "http://h1grf01-v01.devops.int.ovp.bskyb.com/api/dashboards/db").
     	with(:body => {"dashboard"=>"test", "id"=>"50"},
              :headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => "stubbed response", :headers => {})
  end

  config.before(:each) do
    stub_request(:delete, "http://http//h1grf01-v01.devops.int.ovp.bskyb.com/api/dashboards/db:80/testdashboard").
         with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "stubbed response", :headers => {})
  end
end