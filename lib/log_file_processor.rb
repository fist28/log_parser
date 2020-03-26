class LogFileProcessor
  attr_reader :file, :ips, :paths, :entries
  def initialize(file)
    @file = file
    @entries = []
    @paths = {}
    @ips = {}
  end

  def call
    File.open(file, 'r') do |file|
      file.each_line do |line|
        process_log_line(line)
      end
    end
    true
  end

  private

  def process_log_line(line)
    path, ip = line.split(' ')
    paths[path] ||= Path.new(path)
    ips[ip] ||= IP.new(ip)

    entries << LogEntry.new(path: paths[path], ip: ips[ip])
  end
end