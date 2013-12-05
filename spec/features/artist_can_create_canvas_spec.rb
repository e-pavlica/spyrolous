require 'spec_helper'


# As an artist
# I want to create a canvas 
# so that I can begin drawing on it

# Scenario 1: Success
# When I click 'new canvas'
# then a new canvas should be displayed


feature "artist creates canvas", js: true do
  context "successfully" do
    scenario "create a new room" do
      visit "/dashboard"

      find("#newCanvas").click
      page.should have_selector('#spyro')
    end
  end
end