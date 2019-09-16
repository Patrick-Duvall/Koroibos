require 'rails_helper'

RSpec.describe OlympianSport, type: :model do
  describe "relationships" do
    it { should belong_to(:sport) }
    it { should belong_to(:olympian) }
  end
end
