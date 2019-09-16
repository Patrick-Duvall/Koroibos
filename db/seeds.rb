require 'csv'
# Name,Sex,Age,Height,Weight,Team,Games,Sport,Event,Medal
CSV.foreach(Rails.root.join('CSVs/olympic_info.csv'), headers: true) do |row|

sport = Sport.find_or_create_by(name: row[7]) do |sport|
  sport.name = row[7]
end

event = Event.find_or_create_by(name: row[8]) do |event|
  event.name = row[8]
  event.sport = sport
end

olympian = Olympian.find_or_create_by!(name: row[0]) do |olympian|
  olympian.name =  row[0]
  olympian.sex =  row[1]
  olympian.age =  row[2]
  olympian.height =  row[3]
  olympian.weight =  row[4]
  olympian.team =  row[5]
end

OlympianEvent.create( olympian: olympian, event: event, games: row[6], medal: row[9])
OlympianSport.create( olympian: olympian, sport: sport)

end

puts "Created #{Olympian.count} Olympians"
puts "Created #{Sport.count} Sports"
puts "Created #{Event.count} Events"

# describe MyModel do
#   before(:all) do
#   Rails.application.load_seed
# end
