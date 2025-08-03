class HighScores
  def initialize(arr)
    @scores = arr
  end

  def scores
    @scores
  end
  
  def latest
    @scores[-1]
  end

  def personal_best
    @scores.max
  end

  def personal_top_three
    @scores.sort_by{-_1}[0..2]
  end

  def latest_is_personal_best?
    personal_best == latest
  end
end
