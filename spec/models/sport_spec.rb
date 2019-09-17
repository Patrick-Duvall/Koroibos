require 'rails_helper'

RSpec.describe Sport, type: :model do
  describe "relationships" do
    it { should have_many(:events) }
    it { should have_many(:olympian_sports) }
    it { should have_many(:olympians).through(:olympian_sports) }
  end

  before :each do
    @s1 = create(:sport)
    @e1, @e2, @e3 = create_list(:event, 3, sport_id: @s1.id)
  end

  it "instance methods" do
    expect(@s1.event_names).to eq([@e1, @e2, @e3].map(&:name))
  end

end
