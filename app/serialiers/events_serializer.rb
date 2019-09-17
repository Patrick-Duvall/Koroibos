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

# "events":
#     [
#       {
#         "sport": "Archery",
#         "events": [
#           "Archery Men's Individual",
#           "Archery Men's Team",
#           "Archery Women's Individual",
#           "Archery Women's Team"
#         ]
#       },
#       {
#         "sport": "Badminton",
#         "events": [
#           "Badminton Men's Doubles",
#           "Badminton Men's Singles",
#           "Badminton Women's Doubles",
#           "Badminton Women's Singles",
#           "Badminton Mixed Doubles"
#         ]
#       },
#       {...}
#     ]
# }
