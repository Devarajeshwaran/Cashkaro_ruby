# frozen_string_literal: true
require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
reports_dir_name = 'reports'

Dir.glob('lib/tasks/*.rake').each {|task| load task }
Dir.mkdir(reports_dir_name) unless Dir.exist?(reports_dir_name)

# task default: %w(mb:start features:run mb:stop)
task default: %w(features:run)
# task default: %w(features:dev)
