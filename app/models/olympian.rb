class Olympian < ApplicationRecord
  has_many :olympian_events
  has_many :events, through: :olympian_events
  has_many :olympian_sports
  has_many :sports, through: :olympian_sports

  def self.youngest
    youngest_age = minimum(:age)
    find_by(age: youngest_age)
  end

  def self.oldest
    oldest_age = maximum(:age)
    find_by(age: oldest_age)
  end

  def self.male_average_weight
    where(sex: "M")
    .average(:weight)
  end




  def sport
    sports.first.name
  end

  def total_medals_won
    olympian_events
    .where("medal NOT LIKE 'NA'")
    .count
  end
end
