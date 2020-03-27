class LogFileProcessor
  attr_reader :file, :ips, :paths, :entries, :frequency, :uniq_frequency
  def initialize(file)
    @file = file
    @entries = []
    @paths = {}
    @ips = {}

    @frequency = {}
    @uniq_frequency = {}
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
    str_path, str_ip = line.split
    ip = ips[str_ip] ||= IP.new(str_ip)
    path = paths[str_path] ||= Path.new(str_path)

    count_frequency(str_ip, str_path)
    entries << LogEntry.new(path: path, ip: ip)
  end

  def count_frequency(ip, path)
    initialize_frequency(path)

    frequency[path] += 1
    uniq_frequency[path] += 1 if uniq_entry?(ip, path)
  end

  def uniq_entry?(ip, path)
    log_entry = LogEntry.new(path: Path.new(path), ip: IP.new(ip))
    entries.none? { |e| e == log_entry }
  end

  def initialize_frequency(path)
    uniq_frequency[path] ||= 0
    frequency[path] ||= 0
  end
end