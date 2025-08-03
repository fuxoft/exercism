module PhoneNumber
  def self.clean(str)
    digits = str.chars.filter{_1.between?(?0, ?9)}
    digits.delete_at(0) if digits[0]==?1
    return nil unless digits.length == 10
    return nil unless digits[0] >= ?2
    return nil unless digits[3] >= ?2
    digits.join
  end
end
