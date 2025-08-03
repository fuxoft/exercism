module Bob
  def self.hey(str0)
    str = str0.strip
    return "Fine. Be that way!" if str =~ /\A\s*\z/
    all_caps = (str =~ /\p{L}/) && (str == str.upcase)
    question = str.chars.last=="?"
    if all_caps and question
      "Calm down, I know what I'm doing!"
    elsif all_caps
      "Whoa, chill out!"
    elsif question
      "Sure."
    else
      "Whatever."
    end
  end
end

