source 'https://rubygems.org'

puppet_version = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : ['>= 2.7']
gem 'puppet', puppet_version
gem 'puppet-lint', '>= 0.3.2'
gem 'puppetlabs_spec_helper', '>= 0.1.0'
gem 'facter', '>= 1.7.0', "< 1.8.0"
