require 'spec_helper'

describe CanvasesController do
  it "should have a new Layer upon creation" do
    get :new
    expect(Canvas.last.layers.count).to eq(1)
  end

  it "should render the show template" do
    @canvas = FactoryGirl.create(:canvas)
    get :show, id: @canvas.id
    expect(response).to render_template("show")
  end

end
