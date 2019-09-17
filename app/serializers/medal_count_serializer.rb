class MedalCountSerializer

  def self.present_medals
    new.present_medals
  end


 def present_medals
  names = Olympian.select(:team).distinct.pluck(:team)
    countries = names.map do |team_name|
      {
        name: team_name,
        medals: {
          gold: OlympianEvent.gold_count(team_name),
          silver: OlympianEvent.silver_count(team_name),
          bronze: OlympianEvent.bronze_count(team_name)
        }
      }
    end
    { countries: countries }
  end
end
