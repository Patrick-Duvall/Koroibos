require 'rails_helper'

RSpec.describe Olympian, type: :model do
  describe "relationships" do
    it { should have_many(:events).through(:olympian_events) }
    it { should have_many(:sports).through(:olympian_sports) }
    it { should have_many(:olympian_events) }
    it { should have_many(:olympian_sports) }
  end

end
