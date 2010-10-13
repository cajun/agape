require 'hydra'
require 'hydra/tasks'

# set up a new hydra testing task named 'hydra:units' run with "rake hydra:units"
Hydra::TestTask.new('hydra:units') do |t|
  t.add_files 'test/unit/**/*_test.rb'
end

Hydra::TestTask.new('hydra:functionals') do |t|
  t.add_files 'test/functional/**/*_test.rb'
end

Hydra::TestTask.new('hydra:integration') do |t|
  t.add_files 'test/integration/**/*_test.rb'
end

# set up a new hydra testing task named 'hydra:cucumber' run with "rake hydra:cucumber"
Hydra::TestTask.new('hydra:cucumber') do |t|
  # add all files in the features directory that end with ".feature"
  t.add_files 'features/**/*.feature'
end

desc 'Run all test using hydra'
task :hydra => [ 'hydra:units', 'hydra:functionals', 'hydra:integration' ]
