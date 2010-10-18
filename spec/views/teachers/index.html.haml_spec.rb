require 'spec_helper'

describe "teachers/index.html.haml" do
  before(:each) do
    assign(:teachers, [
      stub_model(Teacher,
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :number => 1
      ),
      stub_model(Teacher,
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :number => 1
      )
    ])
  end

  it "renders a list of teachers" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
