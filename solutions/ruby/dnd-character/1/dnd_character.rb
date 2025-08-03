class DndCharacter
  attr_accessor :constitution, :strength, :dexterity, :intelligence, :wisdom, :charisma, :hitpoints
  def self.modifier(x)
    (x-10)/2
  end

  def self.roll()
    rolls = []
    for i in 0..3
      rolls[i] = rand(6) + 1
    end
    rolls.sum - rolls.min
  end

  def initialize
    @constitution = self.class.roll
    @strength = self.class.roll
    @dexterity = self.class.roll
    @intelligence = self.class.roll
    @wisdom = self.class.roll
    @charisma = self.class.roll
    @hitpoints = 10 + self.class.modifier(@constitution)
  end
end
