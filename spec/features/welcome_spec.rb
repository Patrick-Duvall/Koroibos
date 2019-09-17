require "rails_helper"

describe "welcome page do" do

  it "loads by visiting root" do
    visit '/'
    expect(page).to have_link("Click Here")
  end

end
