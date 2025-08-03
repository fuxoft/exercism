class Team
  def initialize(name)
    @name = name
    @wins = 0
    @draws = 0
    @losses = 0
    @matches = 0
  end

  def win
    @wins += 1
    @matches += 1
  end

  def loss
    @losses += 1
    @matches += 1
  end

  def draw
    @draws += 1
    @matches += 1
  end

  def name
    @name
  end

  def mp
    @matches
  end

  def w
    @wins
  end

  def d
    @draws
  end

  def l
    @losses
  end

  def p
    3*@wins + @draws
  end
end

module Tournament
  def self.tally(str)
    @teams = {}
    str.lines(chomp: true).each do |line|
      unless line.empty?
        team1, team2, what = line.match("(.+);(.+);(.+)").captures
        team_named(team1).method(what).call
        if what == "draw"
          team_named(team2).draw
        elsif what == "win"
          team_named(team2).loss
        else
          team_named(team2).win
        end
      end
    end
    result = format_line("Team","MP","W","D","L","P")
    teams = @teams.values.sort{|a,b|
      if a.p == b.p
        a.name <=> b.name
      else
        b.p <=> a.p
      end
    }
    teams.each do |team|
      result << self.format_line(team.name, team.mp, team.w, team.d, team.l, team.p)
    end
    result
  end

  def self.team_named(name)
    unless @teams[name]
      @teams[name] = Team.new(name)
    end
    @teams[name]
  end

  def self.format_line(str1,*strs) # 6 strings
    return str1.ljust(30)+strs.map{" | "+_1.to_s.rjust(2)}.join+"\n"
  end

end
