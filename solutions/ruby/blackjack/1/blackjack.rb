module Blackjack
  def self.parse_card(card)
    case card
    when "two" then 2
    when "three" then 3
    when "four" then 4
    when "five" then 5
    when "six" then 6
    when "seven" then 7
    when "eight" then 8
    when "nine" then 9
    when "ten", "jack", "queen", "king" then 10
    when "ace" then 11
    else 0
    end
  end

  def self.card_range(card1, card2)
    case parse_card(card1) + parse_card(card2)
    when 4..11 then "low"
    when 12..16 then "mid"
    when 17..20 then "high"
    when 21 then "blackjack"
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    if card1 == "ace" && card2 == "ace"
      return "P"
    end
    sum = parse_card(card1) + parse_card(card2)
    if sum <= 11
      return "H"
    end
    if sum in 17..20
      return "S"
    end
    deal = parse_card(dealer_card)
    if sum in 12..16
      if deal >= 7
        return "H"
      else
        return "S"
      end
    end
    if sum == 21
      if deal < 10
        return "W"
      else
        return "S"
      end
    end
    raise "WTF?"
  end
end
