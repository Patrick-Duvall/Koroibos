class Olympian < ApplicationRecord
  has_many :olympian_events
  has_many :events, through: :olympian_events
  has_many :olympian_sports
  has_many :sports, through: :olympian_sports

  def sport
    sports.first.name
  end

  def medal_count
    olympian_events
    .where("medal NOT LIKE 'NA'")
    .count
  end
end
