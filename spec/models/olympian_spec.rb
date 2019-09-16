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
      create(:olympian_sport, olympian_id: @o1.id, sport_id: @s1.id)
      create(:olympian_sport, olympian_id: @o1.id, sport_id: @s2.id)
    end
    it ".sport" do
      expect(@o1.sport).to eq(@s1.name)
    end
    xit "medal_count" do

    end

  end

end
