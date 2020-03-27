class LogEntry
  attr_reader :path, :ip

  def initialize(path:, ip:)
    @path = path
    @ip = ip
  end

  def ==(other)
    path == other.path &&
      ip == other.ip
  end
end