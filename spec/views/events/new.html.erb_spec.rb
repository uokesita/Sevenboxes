require 'spec_helper'

describe "events/new.html.erb" do
  before(:each) do
    assign(:event, stub_model(Event,
      :title => "MyString",
      :description => "MyString",
      :link => "MyString"
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => events_path, :method => "post" do
      assert_select "input#event_title", :name => "event[title]"
      assert_select "input#event_description", :name => "event[description]"
      assert_select "input#event_link", :name => "event[link]"
    end
  end
end
