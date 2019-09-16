require 'rails_helper'

RSpec.describe OlympicEvent, type: :model do
  describe "relationships" do
    it { should belong_to(:event) }
    it { should belong_to(:olympian) }
  end
end
