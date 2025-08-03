module ETL
  def self.transform(old)
    result = {}
    old.each_pair do |score, letters|
      letters.each{result[_1.downcase]=score}
    end
    result
  end
end