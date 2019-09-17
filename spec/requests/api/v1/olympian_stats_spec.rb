require "rails_helper"

describe "Olympians Index do" do

  before :each do
    @o1, @o2, @o3, @o4 = create_list(:olympian, 4)
  end

  it "gets olympian stats" do
    get "/api/v1/olympian_stats"
    expect(response).to be_successful
    expect(response.status).to eq(200)
    data = JSON.parse(response.body)
    expect(data['olympian_stats']["total_competing_olympians"]).to eq(4)
    expect(data['olympian_stats']).to include("average_age")
    expect(data['olympian_stats']["average_weight"]["unit"]).to eq("kg")
    expect(data['olympian_stats']["average_weight"]).to include("male_olympians")
    expect(data['olympian_stats']["average_weight"]).to include("female_olympians")
  end
end
