# Run the Rakefile in the root of the gem (where the gemspec is)
require "bundler/gem_tasks"

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*.rb']
end

task :default => [:test]
task :release => [:build, :install]