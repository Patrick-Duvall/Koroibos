class OlympianStatsSerializer

  def self.present_stats
    new.present_stats
  end

  def present_stats
    {
        olympian_stats: {
          total_competing_olympians: Olympian.count,
          average_age: Olympian.average_age.round(1),
          average_weight: {
            unit: "kg",
            male_olympians: Olympian.male_average_weight.round(1),
            female_olympians: Olympian.female_average_weight.round(1)
          }
        }
      }
  end

end
