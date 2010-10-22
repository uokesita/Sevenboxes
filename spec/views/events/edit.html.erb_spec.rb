require 'spec_helper'

describe "events/edit.html.erb" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :new_record? => false,
      :title => "MyString",
      :description => "MyString",
      :link => "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => event_path(@event), :method => "post" do
      assert_select "input#event_title", :name => "event[title]"
      assert_select "input#event_description", :name => "event[description]"
      assert_select "input#event_link", :name => "event[link]"
    end
  end
end
