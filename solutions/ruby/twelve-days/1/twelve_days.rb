module TwelveDays
  @@days = %w(first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth)
  @@gifts = [
    "a Partridge in a Pear Tree",
    "two Turtle Doves",
    "three French Hens",
    "four Calling Birds",
    "five Gold Rings",
    "six Geese-a-Laying",
    "seven Swans-a-Swimming",
    "eight Maids-a-Milking",
    "nine Ladies Dancing",
    "ten Lords-a-Leaping",
    "eleven Pipers Piping",
    "twelve Drummers Drumming"
  ]
  
  def self.song()
    whole = ""
    for day in 1..12
      whole << "On the #{@@days[day-1]} day of Christmas my true love gave to me: "
      if day == 1
        whole << @@gifts[0]
      else
        gifts = []
        for d in (day..2).step(-1)
          whole << @@gifts[d-1] << ", "
        end
        whole << "and #{@@gifts[0]}"
      end
      whole << ".\n"
      if day != 12
        whole << "\n"
      end
    end
    whole
  end
end
