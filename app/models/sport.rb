class Sport < ApplicationRecord
  has_many :olympian_sports
  has_many :olympians, through: :olympian_sports
  has_many :events

  def event_names
    events.pluck(:name)
  end
end
