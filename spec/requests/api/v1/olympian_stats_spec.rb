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
    require "pry"; binding.pry
  end
end
# {
#     "olympian_stats": {
#       "total_competing_olympians": 3120
#       "average_weight:" {
#         "unit": "kg",
#         "male_olympians": 75.4,
#         "female_olympians": 70.2
#       }
#       "average_age:" 26.2
#     }
#   }
