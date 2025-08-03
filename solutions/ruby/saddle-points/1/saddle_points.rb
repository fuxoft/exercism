module Grid
  class Matrix
    def initialize(rows)
      @rows = rows
    end
    def row(i)
      @rows[i]
    end
    def column(j)
      @rows.map { |row| row[j] }
    end
    def with_indexes
      @rows.each_with_index.map do |row, i|
        row.each_with_index.map do |value, j|
          yield value, i, j
        end
      end
    end
  end
  
  def self.saddle_points(arrs)
    mat = Matrix.new(arrs)
    result = []
    mat.with_indexes do |n, row, column|
      if mat.row(row).max==n and mat.column(column).min==n
        result << {"row"=>row+1,"column"=>column+1}
      end
    end
    result
  end
end