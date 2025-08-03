module Acronym
  def self.abbreviate(name)
    name.sub("-"," ").split.map{|word| word[0].upcase}.join
  end
end