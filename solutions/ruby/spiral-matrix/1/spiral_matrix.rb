class SpiralMatrix
  def initialize(dim)
    @dim=dim
  end

  def matrix
    arr = Array.new(@dim) {[]}
    dim=@dim
    c,ind = 0,dim
    loop do
      (dim-ind).upto(ind-1) {arr[dim-ind][_1] = c+=1}
      break if c == dim**2
      (dim-ind+1).upto(ind-1) {arr[_1][ind-1] = c+=1}
      (ind-2).downto(dim-ind) {arr[ind-1][_1] = c+=1}
      break if c == dim**2
      (ind-2).downto(dim-ind+1) {arr[_1][dim-ind] = c+=1}
      ind -= 1
    end
    arr
  end
end