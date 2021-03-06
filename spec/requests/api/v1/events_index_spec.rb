
require "rails_helper"

describe "Olympians Index do" do

  before :each do
    @s1, @s2, @s3= create_list(:sport, 3)
    @e1, @e2, @e3 = create_list(:event, 3, sport_id: @s1.id)
    @e4, @e5, @e6 = create_list(:event, 3, sport_id: @s2.id)
    @e7, @e8, @e9 = create_list(:event, 3, sport_id: @s3.id)
  end

  it "gets olympian stats" do
    get "/api/v1/events"
    expect(response).to be_successful
    expect(response.status).to eq(200)
    data = JSON.parse(response.body)
    expect(data['events'].count).to eq(3)
    expect(data['events'][0]['sport']).to eq(@s1.name)
    expect(data['events'][0]['events'].count).to eq(3)
  end
end
