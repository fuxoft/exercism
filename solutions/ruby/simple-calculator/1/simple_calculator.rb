class SimpleCalculator

  class UnsupportedOperation < StandardError
  end

  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(n1, n2, oper)
    unless ALLOWED_OPERATIONS.include?(oper)
      raise UnsupportedOperation
    end
    if not (n1.is_a? Integer and n2.is_a? Integer)
      raise ArgumentError
    end
    if oper == '/' && n2 == 0
      return "Division by zero is not allowed."
    end
    return "#{n1} #{oper} #{n2} = " +
    case oper
      when '+' then n1 + n2
      when '/' then n1 / n2
      when '*' then n1 * n2
    end.to_s
  end
end
