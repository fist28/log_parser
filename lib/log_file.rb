class LogFile
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
    @log_processor = LogFileProcessor.new(file_path)
  end

  def call
    return nil if invalid_file?

    @log_processor.call
    true
  end

  def views
    sorted_frequency.map do |page_frequency|
      page, frequency = page_frequency
      "#{page} #{frequency} views"
    end
  end

  def unique_views
    sorted_unique_frequency.map do |page_frequency|
      page, frequency = page_frequency
      "#{page} #{frequency} unique views"
    end
  end

  def to_s
    views.join("\n") +
      "\n\n" +
      unique_views.join("\n")
  end

  private

  def sorted_frequency
    @log_processor.frequency.sort { |a, b| b.last <=> a.last }
  end

  def sorted_unique_frequency
    @log_processor.uniq_frequency.sort { |a, b| b.last <=> a.last }
  end

  def invalid_file?
    file_path.nil?
  end
end