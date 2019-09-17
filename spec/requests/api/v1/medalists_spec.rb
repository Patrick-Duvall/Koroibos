
require "rails_helper"

describe " Event Medalists " do

  before :each do
    @s1 = create(:sport)
    @e1 = create(:event, sport_id: @s1.id)
    @o1, @o2, @o3 = create_list(:olympian, 3)
    @oe1 = create(:olympian_event, olympian_id: @o1.id, event_id: (@e1.id), medal: "Gold")
    @oe2 = create(:olympian_event, olympian_id: @o2.id, event_id: (@e1.id), medal: "Silver")
    @oe2 = create(:olympian_event, olympian_id: @o3.id, event_id: (@e1.id), medal: "NA")

  end

  it "gets olympian stats" do
    get "/api/v1/events/#{@e1.id}/medalists"
    expect(response).to be_successful
    expect(response.status).to eq(200)
    data = JSON.parse(response.body)
    expect(data['event']).to eq(@e1.name)
    expect(data['medalists'].count).to eq(2)
    expect(data['medalists'][0]['name']).to eq(@o1.name)
    expect(data['medalists'][0]['team']).to eq(@o1.team)
    expect(data['medalists'][0]['age']).to eq(@o1.age)
    expect(data['medalists'][0]['medal']).to eq(@oe1.medal)
  end
  it "event not found" do
    get "/api/v1/events/#{@e1.id + 1}/medalists"
    expect(response.status).to eq(404)
  end
end

# {
#   "event": "Badminton Mixed Doubles",
#   "medalists": [
#       {
#         "name": "Tontowi Ahmad",
#         "team": "Indonesia-1",
#         "age": 29,
#         "medal": "Gold"
#       },
#       {
#         "name": "Chan Peng Soon",
#         "team": "Malaysia",
#         "age": 28,
#         "medal": "Silver"
#       }
#     ]
# }
# ```
# *Returns a 404 if event cannot be found.
