module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city[0..3].upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    pref = ship_identifier[0..2]
    pref == "OIL" || pref == "GAS" ? :A : :B
  end
end
