require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the typus plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the typus plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_files.add ['README.rdoc', 'MIT-LICENSE', 'lib/**/*.rb']
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Typus documentation'
  rdoc.main = 'README.rdoc'
  rdoc.options << '--charset=UTF-8'
  rdoc.options << '--inline-source'
  rdoc.options << '--line-numbers'
end

desc 'Generate specdoc-style documentation from tests'
task :specs do

  puts 'Started'
  timer, count = Time.now, 0

  File.open('SPECDOC', 'w') do |file|
    Dir.glob('test/**/*_test.rb').each do |test|
      test =~ /.*\/([^\/].*)_test.rb$/
      file.puts "#{$1.gsub('_', ' ').capitalize} should:" if $1
      File.read(test).map { |line| /test_(.*)$/.match line }.compact.each do |spec|
        file.puts "- #{spec[1].gsub('_', ' ')}"
        sleep 0.001; print '.'; $stdout.flush; count += 1
      end
      file.puts
    end
  end

  puts "\nFinished in #{Time.now - timer} seconds.\n"
  puts "#{count} specifications documented"

end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "typus"
    gemspec.summary = "Effortless backend interface for Ruby on Rails applications. (Admin scaffold generator.)"
    gemspec.email = "francesc@intraducibles.com"
    gemspec.homepage = "http://intraducibles.com/projects/typus"
    gemspec.description = "Effortless backend interface for Ruby on Rails applications. (Admin scaffold generator.)"
    gemspec.authors = ["Francesc Esplugas"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler -s http://gemcutter.org"
end