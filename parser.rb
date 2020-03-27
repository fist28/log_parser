#!/usr/bin/env ruby
Dir['lib/*.rb'].each { |path| require_relative(path) }

log_file = LogFile.new(ARGV[0])
log_file.call
puts log_file