require 'rails_helper'

RSpec.describe OlympianEvent, type: :model do
  describe "relationships" do
    it { should belong_to(:event) }
    it { should belong_to(:olympian) }
  end

  describe "class methods" do

    before :each do
      @s1 = create(:sport)
      @e1, @e2, @e3, @e4, @e5, @e6 = create_list(:event, 6, sport_id: @s1.id)

      @o1 = create(:olympian, team: "USA")

      @oe1 = create(:olympian_event, olympian_id: @o1.id, event_id: (@e1.id), medal: "Gold")
      @oe2 = create(:olympian_event, olympian_id: @o1.id, event_id: (@e2.id), medal: "Gold")
      @oe3 = create(:olympian_event, olympian_id: @o1.id, event_id: (@e3.id), medal: "Silver")
      @oe4 = create(:olympian_event, olympian_id: @o1.id, event_id: (@e4.id), medal: "Silver")
      @oe5 = create(:olympian_event, olympian_id: @o1.id, event_id: (@e5.id), medal: "Silver")
      @oe6 = create(:olympian_event, olympian_id: @o1.id, event_id: (@e6.id), medal: "Bronze")
    end

    it "#gold_count(team)" do
      expect(OlympianEvent.gold_count("USA")).to eq(2)
    end
    it "#silver_count(team)" do
      expect(OlympianEvent.silver_count("USA")).to eq(3)
    end
    it "#bronze_count(team)" do
      expect(OlympianEvent.bronze_count("USA")).to eq(1)
    end
  end
end
