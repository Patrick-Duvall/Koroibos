class OlympianEvent < ApplicationRecord
  belongs_to :olympian
  belongs_to :event

  def self.gold_count(team)
    # To avoid sql error on Cote d'Ivoire
    team = team.gsub("\'", "\'\'")
    joins(:olympian)
    .where("olympians.team like '#{team}'")
    .where("olympian_events.medal like 'Gold'")
    .count
  end
  def self.silver_count(team)
    team = team.gsub("\'", "\'\'")
    joins(:olympian)
    .where("olympians.team like '#{team}'")
    .where("olympian_events.medal like 'Silver'")
    .count
  end
  def self.bronze_count(team)
    team = team.gsub("\'", "\'\'")
    joins(:olympian)
    .where("olympians.team like '#{team}'")
    .where("olympian_events.medal like 'Bronze'")
    .count
  end
end
