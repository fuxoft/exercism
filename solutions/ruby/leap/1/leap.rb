class Year
  def self.leap?(yr)
    if yr % 100 == 0
      if yr % 400 == 0
        true
      else
        false
      end
    else
      yr % 4 == 0
    end
  end
end
