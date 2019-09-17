class OlympianStatsSerializer

  def self.present_stats
    new.present_stats
  end

  def present_stats
    {
        olympian_stats: {
          total_competing_olympians: Olympian.count,
          average_age: Olympian.average_age,
          average_weight: {
            unit: "kg",
            male_olympians: Olympian.male_average_weight,
            female_olympians: Olympian.female_average_weight
          }
        }
      }
  end

end
