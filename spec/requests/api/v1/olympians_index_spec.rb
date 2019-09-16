require "rails_helper"

describe "Olympians Index do" do

  before :each do
    @o1, @o2, @o3 = create_list(:olympian, 3)
    @s1, @s2, @s3 = create_list(:sport, 3)
    create(:olympian_sport, olympian_id: @o1.id, sport_id: @s1.id)
    create(:olympian_sport, olympian_id: @o2.id, sport_id: @s2.id)
    create(:olympian_sport, olympian_id: @o3.id, sport_id: @s3.id)
  end

  it "gets all olympians" do
    get "/api/v1/olympians"
    expect(response).to be_successful
    expect(response.status).to eq(200)
    data = JSON.parse(response.body)
    expect(data["olympians"].count).to eq(3)
    expect(data["olympians"][0]['name']).to eq(@o1.name)
    expect(data["olympians"][0]['team']).to eq(@o1.team)
    expect(data["olympians"][0]['age']).to eq(@o1.age)
    expect(data["olympians"][0]['sport']).to eq(@s1.name)
    expect(data["olympians"][0]['total_medals_won']).to eq(0)
  end

  it "gets youngest olympian do" do
    # cannot be in same format as project outline
    get "/api/v1/olympians?age=youngest"
    expect(response).to be_successful
    expect(response.status).to eq(200)
    data = JSON.parse(response.body)
    expect(data["olympians"].count).to eq(1)
    expect(data["olympians"][0]['name']).to eq(@o1.name)
    expect(data["olympians"][0]['team']).to eq(@o1.team)
    expect(data["olympians"][0]['age']).to eq(@o1.age)
    expect(data["olympians"][0]['sport']).to eq(@s1.name)
    expect(data["olympians"][0]['total_medals_won']).to eq(0)
  end

  it "gets oldest olympian do" do
    # cannot be in same format as project outline
    get "/api/v1/olympians?age=oldest"
    expect(response).to be_successful
    expect(response.status).to eq(200)
    data = JSON.parse(response.body)
    expect(data["olympians"].count).to eq(1)
    expect(data["olympians"][0]['name']).to eq(@o3.name)
    expect(data["olympians"][0]['team']).to eq(@o3.team)
    expect(data["olympians"][0]['age']).to eq(@o3.age)
    expect(data["olympians"][0]['sport']).to eq(@s3.name)
    expect(data["olympians"][0]['total_medals_won']).to eq(0)
  end

end
