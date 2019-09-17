
require "rails_helper"

describe "Olympians Index do" do

  before :each do
    @o1, @o2, @o3= create_list(:sport, 3)
    @e1, @e2, @e3 = create_list(:event, 3, sport_id: @o1.id)
    @e4, @e5, @e6 = create_list(:event, 3, sport_id: @o2.id)
    @e7, @e8, @e9 = create_list(:event, 3, sport_id: @o3.id)
  end

  it "gets olympian stats" do
    get "/api/v1/events"
    expect(response).to be_successful
    expect(response.status).to eq(200)
    data = JSON.parse(response.body)
  end
end


#   "events":
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
