require "rails_helper"

describe "Medal Count do" do

  before :each do
    @s1, @s2, @s3= create_list(:sport, 3)
    @e1, @e2, @e3 = create_list(:event, 3, sport_id: @s1.id)
    @e4, @e5, @e6 = create_list(:event, 3, sport_id: @s2.id)
    @e7, @e8, @e9 = create_list(:event, 3, sport_id: @s3.id)

    @o1 = create(:olympian, team: "USA")
    @o2 = create(:olympian, team: "USA")
    @o3 = create(:olympian, team: "USA")

    @o4 = create(:olympian, team: "France")
    @o5 = create(:olympian, team: "France")
    @o6 = create(:olympian, team: "France")


    @oe1 = create(:olympian_event, olympian_id: @o1.id, event_id: (@e1.id), medal: "Gold")
    @oe2 = create(:olympian_event, olympian_id: @o1.id, event_id: (@e5.id), medal: "Bronze")
    @oe3 = create(:olympian_event, olympian_id: @o2.id, event_id: (@e1.id), medal: "Bronze")
    @oe4 = create(:olympian_event, olympian_id: @o3.id, event_id: (@e3.id), medal: "Silver")
    @oe5 = create(:olympian_event, olympian_id: @o5.id, event_id: (@e9.id), medal: "Gold")
    @oe6 = create(:olympian_event, olympian_id: @o4.id, event_id: (@e8.id), medal: "Bronze")
  end

  it "gets olympian stats" do
    get "/api/v1/medal_count"
    expect(response).to be_successful
    expect(response.status).to eq(200)
    data = JSON.parse(response.body)
    usa = { "name" => "USA",
            "medals" => {
              "gold" => 1,
              "silver" => 1,
              "bronze" => 2
            }
          }
    france = { "name" => "France",
               "medals" => {
                 "gold" => 1,
                 "silver" => 0,
                 "bronze" => 1
               }
             }

    expect(data['countries']).to include(usa)
    expect(data['countries']).to include(france)
  end
end
