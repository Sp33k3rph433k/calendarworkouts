require 'resque/tasks'
require 'resque/scheduler/tasks'
#require 'resque/plugins/heroku/tasks'

namespace :resque do
  task :setup => :environment do
    require 'resque'
    require 'resque-scheduler'

    ENV['QUEUE'] ||= '*'

    Resque::Scheduler.configure do |c|
      c.quiet = false
      c.verbose = true
      c.logfile = nil
      c.logformat = 'text'
    end

    Resque.after_fork = Proc.new do
      ActiveRecord::Base.establish_connection
    end

  end
end

task "jobs:work" => "resque:work"