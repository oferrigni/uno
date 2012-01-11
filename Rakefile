require 'rubygems'

task :default => [:'get-deps',:build]

desc "Fetch dependencies"
task :'get-deps' do 
  rebar 'get-deps'
end

desc "Run eunit tests with rebar"
task :test => :build do
    rebar_test 'eunit skip_deps=true'
end

desc "Use rebar to build the application"
task :build do
    rebar 'compile'
end

def rebar_test(param_string)
    rebar = File.join(File.dirname(__FILE__), 'rebar')
    sh "\"#{rebar}\" #{param_string}" do |ok, res|
      if ! ok
          message = "\e[0;31m \n\n************************************\n\t"
          message += "Something failed running: \e[m'rebar #{param_string}'"
          message += "\e[0;31m\n************************************\e[m"
          fail "#{message}"
      else
          message = "\e[0;32m \n\n************************************\n\t"
          message += "Everything Passed"
          message += "\n************************************\e[m"
          puts "#{message}"
      end
    end
end

def rebar(param_string)
  rebar = File.join(File.dirname(__FILE__), 'rebar')
  sh "\"#{rebar}\" #{param_string}" do |ok, res|
      if ! ok
          message = "\e[0;31m \n\n************************************\n\t"
          message += "Something failed running: \e[m'rebar #{param_string}'"
          message += "\e[0;31m\n************************************\e[m"
          fail "#{message}"
      end
  end
end

