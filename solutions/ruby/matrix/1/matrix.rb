class Matrix
  def initialize(str)
    @matrix = str.lines.map{|line| line.split.map(&:to_i)}
    debug(@matrix)
  end

  def row(r)
    @matrix[r-1]
  end

  def column(c)
    @matrix.map{|row| row[c-1]}
  end
end