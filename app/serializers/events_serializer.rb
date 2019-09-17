class EventsSerializer

  def self.present_events
    new.present_events
  end

  def present_events
    sports = Sport.includes(:events)
    events = sports.map do |sport|
      {sport: sport.name,
        events: sport.event_names
      }
    end
    {events: events }
  end

end
