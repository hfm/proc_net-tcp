require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'bundler/setup'
require 'proc_net/tcp'
require 'proc_net/udp'
require 'test/unit'
