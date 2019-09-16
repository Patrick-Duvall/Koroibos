require 'rails_helper'

RSpec.describe Olympian, type: :model do
  describe "relationships" do
    it { should have_many(:events).through(:olympian_events) }
    it { should have_many(:sports).through(:olympian_sports) }
    it { should have_many(:olympian_events) }
    it { should have_many(:olympian_sports) }
  end

  describe "instance methods" do
    before :each do
      @o1 = create(:olympian)
      @s1, @s2 = create_list(:sport, 2)
      @e1, @e2  = create_list(:event, 2, sport_id: @s1.id)
      create(:olympian_sport, olympian_id: @o1.id, sport_id: @s1.id)
      create(:olympian_sport, olympian_id: @o1.id, sport_id: @s2.id)
      create(:olympian_event, olympian_id: @o1.id, event_id: @e1.id, medal: "Gold")
      create(:olympian_event, olympian_id: @o1.id, event_id: @e2.id, medal: "Bronze")
    end
    it ".sport" do
      expect(@o1.sport).to eq(@s1.name)
    end
    it "total_medals_won" do
      expect(@o1.medal_count).to eq(2)
    end

  end

end
