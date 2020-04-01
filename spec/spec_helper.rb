require 'simplecov'
require 'byebug'
SimpleCov.start
project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/../lib/*.rb') { |file| require file }
