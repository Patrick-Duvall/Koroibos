class EventMedalistsSerializer

  def self.present_medalists(event)
    new.present_medalists(event)
  end

  def present_medalists(event)
    medalists = event.medalists.map do |medalist|
      {
        name: medalist.name,
        age: medalist.age,
        team: medalist.team,
        medal: medalist.medal,
      }
    end
    { event: event.name, medalists: medalists }
  end
end
