#!/usr/bin/env ruby
Dir['lib/*.rb'].each { |path| require_relative(path) }

log_file = LogFile.new(ARGV[0])
puts log_file if log_file.call