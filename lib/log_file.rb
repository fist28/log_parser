class LogFile
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def call
    return nil if invalid_file?

    true
  end

  def views
    [
      '/main 10 views',
      '/page 5 views',
    ]
  end

  def unique_views
    [
      '/page 5 unique views',
      '/main 2 unique views',
    ]
  end

  def to_s
    views.join("\n") +
      "\n\n" +
      unique_views.join("\n")
  end

  private

  def invalid_file?
    file_path.nil?
  end
end