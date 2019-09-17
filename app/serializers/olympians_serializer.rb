class OlympiansSerializer
  def initialize(olympians)
    @olympians = olympians
  end

  def present_olympians
    olympians_array = @olympians.map do |olympian|
      {
        name: olympian.name,
        age: olympian.age,
        team: olympian.team,
        sport: olympian.sport,
        total_medals_won: olympian.total_medals_won
      }
    end
    {"olympians" => olympians_array}
  end

end
