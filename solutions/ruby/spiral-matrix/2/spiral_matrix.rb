class SpiralMatrix
  def initialize(dim)
    @dim=dim
  end

  def put(x,y,n)
    return if n > @dim**2
    @arr[x][y] = n
    if y.between?(x-1,@dim-x-2)
      put(x,y+1,n+1)
    elsif x.between?(@dim-y-1,y-1)
      put(x+1,y,n+1)
    elsif y.between?(@dim-x,x)
      put(x,y-1,n+1)
    else
      put(x-1,y,n+1)
    end
  end
  
  def matrix
    @arr = Array.new(@dim) {[]}
    put(0,0,1)
    @arr
  end
end