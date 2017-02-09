require 'rake'
require 'rspec/core/rake_task'
 
desc 'Run all tests for this tool'
RSpec::Core::RakeTask.new(:spec) do |t|
t.pattern = Dir.glob('spec/**/*_spec.rb')
t.rspec_opts = '--format documentation'
end
task :default => :spec