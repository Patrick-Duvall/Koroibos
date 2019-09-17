require 'rails_helper'

RSpec.describe Olympian, type: :model do

  before :each do
    @o1, @o2, @o3, @o4 = create_list(:olympian, 4)
    @s1, @s2 = create_list(:sport, 2)
    @e1, @e2  = create_list(:event, 2, sport_id: @s1.id)
    create(:olympian_sport, olympian_id: @o1.id, sport_id: @s1.id)
    create(:olympian_sport, olympian_id: @o4.id, sport_id: @s2.id)
    create(:olympian_sport, olympian_id: @o1.id, sport_id: @s2.id)
    create(:olympian_event, olympian_id: @o1.id, event_id: @e1.id, medal: "Gold")
    create(:olympian_event, olympian_id: @o1.id, event_id: @e2.id, medal: "Bronze")
  end

  describe "relationships" do
    it { should have_many(:events).through(:olympian_events) }
    it { should have_many(:sports).through(:olympian_sports) }
    it { should have_many(:olympian_events) }
    it { should have_many(:olympian_sports) }
  end

  describe "instance methods" do
    it ".sport" do
      expect(@o1.sport).to eq(@s1.name)
    end
    it "total_medals_won" do
      expect(@o1.total_medals_won).to eq(2)
    end
  end

  describe "class methods" do
    it "#youngest" do
      expect(Olympian.youngest).to eq(@o1)
    end
    it "#oldest" do
      expect(Olympian.oldest).to eq(@o4)
    end
    it "#male_average_weight" do
      weight = (@o2.weight + @o4.weight).fdiv(2)
      expect(Olympian.male_average_weight).to eq(weight)
    end
    it "#female_average_weight" do
      weight = (@o1.weight + @o3.weight).fdiv(2)
      expect(Olympian.female_average_weight).to eq(weight)
    end
    it "#average_age" do
      age = Olympian.average(:age)
      expect(Olympian.average_age).to eq(age)
    end

  end

end
