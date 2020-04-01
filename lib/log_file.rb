class LogFile
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
    @log_processor = LogFileProcessor.new(file_path)
  end

  def call
    return nil unless valid_file?

    @log_processor.call
    true
  end

  def views
    display_prepare(sorted_frequency, 'views')
  end

  def unique_views
    display_prepare(sorted_unique_frequency, 'unique views')
  end

  def to_s
    views.join("\n") +
      "\n\n" +
      unique_views.join("\n")
  end

  private

  def display_prepare(collection, suffix = '')
    collection.map do |page_frequency|
      page, frequency = page_frequency
      "#{page} #{frequency} #{suffix}"
    end
  end

  def sorted_frequency
    sort_frequency(@log_processor.frequency)
  end

  def sorted_unique_frequency
    sort_frequency(@log_processor.uniq_frequency)
  end

  def sort_frequency(collection)
    collection.sort { |a, b| b.last <=> a.last }
  end

  def valid_file?
    !file_path.nil? &&
      File.exist?(file_path)
  end
end