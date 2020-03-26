class LogFile
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def call
    return nil if invalid_file?

    true
  end

  private

  def invalid_file?
    file_path.nil?
  end
end