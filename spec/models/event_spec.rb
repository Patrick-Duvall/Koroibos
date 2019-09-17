require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "relationships" do
    it { should belong_to(:sport) }
    it { should have_many(:olympians) }
    it { should have_many(:olympians).through(:olympian_events) }
  end

  before :each do
    @s1 = create(:sport)
    @e1 = create(:event, sport_id: @s1.id)
    @o1, @o2, @o3 = create_list(:olympian, 3)
    @oe1 = create(:olympian_event, olympian_id: @o1.id, event_id: (@e1.id), medal: "Gold")
    @oe2 = create(:olympian_event, olympian_id: @o2.id, event_id: (@e1.id), medal: "Silver")
    @oe3 = create(:olympian_event, olympian_id: @o3.id, event_id: (@e1.id), medal: "NA")
  end

  describe "instance methods " do
    it "medalists" do
        expect(@e1.medalists).to eq([@o1, @o2])
    end
  end
end
