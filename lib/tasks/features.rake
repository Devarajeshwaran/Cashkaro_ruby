# frozen_string_literal: true
namespace :features do
  Cucumber::Rake::Task.new(:run) do |t|
    t.profile = ENV['PROFILE'] || 'default'
  end
  Cucumber::Rake::Task.new(:story) do |t|
    t.profile = ENV['PROFILE'] || 'dev'
  end
  Cucumber::Rake::Task.new(:test) do |t|
    t.profile = ENV['PROFILE'] || 'all'
  end
end