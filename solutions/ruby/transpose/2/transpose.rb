module Transpose
  def self.transpose(str)
    lines = str.lines(chomp:true)
    maxlen = lines.map(&:length).max
    return '' if not maxlen
    result = (0..maxlen-1).map {|i|
      replace = nil
      lines
            .map {|line| line[i]}
            .reverse
            .map {|chr|
              if chr then
                replace = ' '
                chr
              else
                replace
              end}
            .reverse
            .join
    }
    result.join("\n")
  end
end
