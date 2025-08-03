module SavingsAccount
  def self.interest_rate(bal)
    if bal < 0
      3.213
    elsif bal < 1000
      0.5
    elsif bal < 5000
      1.621
    else
      2.475
    end
  end

  def self.annual_balance_update(bal)
    bal + interest_rate(bal) * 0.01 * bal
  end

  def self.years_before_desired_balance(cur, desir)
    cnt = 0
    while cur < desir
      cnt += 1
      cur = annual_balance_update(cur)
    end
    cnt
  end
end
