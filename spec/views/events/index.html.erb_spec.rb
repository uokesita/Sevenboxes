require 'spec_helper'

describe "events/index.html.erb" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :title => "Title",
        :description => "Description",
        :link => "Link"
      ),
      stub_model(Event,
        :title => "Title",
        :description => "Description",
        :link => "Link"
      )
    ])
  end

  it "renders a list of events" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Link".to_s, :count => 2
  end
end
