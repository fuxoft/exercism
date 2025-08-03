module ParallelLetterFrequency
  def self.ractor_count(str)
    Ractor.new(str){|str|       
      hash = Hash.new(0)
      str.downcase.gsub(/[^\p{Alpha}]/, '').grapheme_clusters.each{|chr|
        hash[chr]+=1}
      hash
    }
  end

  def self.sum_hashes((hsh1,*rest))
    #debug({hsh1:hsh1, rest:rest})
    rest.each{|hsh|
      hsh.each_pair{|k,v| hsh1[k]+=v}
    }
    hsh1
  end
  
  def self.count(strings)
    racts = strings.map{|str| self.ractor_count(str)}
    sum_hashes(racts.map{|rct| rct.take}) or {}
  end
end
