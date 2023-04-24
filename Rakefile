# frozen_string_literal: true

require_relative './lib/pager_duty/version'

GEM_NAME = 'pager_duty'

task default: :build

task :build do
  system "gem build #{GEM_NAME}.gemspec"
end

task install: :build do
  system "gem install #{GEM_NAME}-#{PagerDuty::VERSION}.gem"
end

task reinstall: :install

task :clean do
  system 'rm *.gem'
end

task :uninstall do
  system 'yes | gem uninstall pager_duty'
end
