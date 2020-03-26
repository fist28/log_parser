class LogEntry
  attr_reader :path, :ip

  def initialize(path: path, ip: ip)
    @path = path
    @ip = ip
  end

end