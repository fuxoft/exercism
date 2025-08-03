class Sieve
  def initialize(upto)
    @upto = upto
  end
  def primes
    arr = [nil,nil,*2..@upto]
    arr[0],arr[1] = nil, nil
    (2..@upto).each do |n|
      if arr[n]
        (n+n..@upto).step(n) {arr[_1]=nil}
      end
    end
    arr.compact
  end
end