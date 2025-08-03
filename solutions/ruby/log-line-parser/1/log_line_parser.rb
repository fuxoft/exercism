class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    /\]: (.*)/.match(@line)[1].strip
  end

  def log_level
    /\[(\w*)\]/.match(@line)[1].downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
