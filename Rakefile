require 'rake'
require 'rspec/core/rake_task'
require 'jsonlint/rake_task'

desc 'JSON Lint test on files in templates directory'
JsonLint::RakeTask.new(:jsonlint) do |t|
  t.paths = %w(
    templates/*.json
  )
end
 
desc 'Run all tests for this tool'
RSpec::Core::RakeTask.new(:spec) do |t|
t.pattern = Dir.glob('spec/**/*_spec.rb')
t.rspec_opts = '--format documentation'
end

task :default => [:spec, :jsonlint]