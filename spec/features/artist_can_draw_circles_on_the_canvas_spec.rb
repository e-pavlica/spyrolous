require 'spec_helper'

# As an artist,
# I want to draw circles wherever I click on the canvas.

# Scenario 1: Success
# When artist clicks on the canvas
# a circle is drawn as an svg in the spot that they clicked
# and the data is stored to the database as a circle.

feature "artist can draw a circle on the canvas" do 
  context "successfully" do
    scenario "click on the spiro container" do
      visit new_canvas_path

    end #end scenario
  end #end context
end #end feature
  
