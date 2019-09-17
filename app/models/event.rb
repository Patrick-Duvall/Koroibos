class Event < ApplicationRecord
  belongs_to :sport
  has_many :olympian_events
  has_many :olympians, through: :olympian_events

  def medalists
  olympians.joins(:olympian_events)
  .select('olympians.*, olympian_events.medal')
  .where("olympian_events.event_id = #{id}")
  .where("olympian_events.medal NOT LIKE 'NA'")
  .distinct
  end
end
