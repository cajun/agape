require 'spec_helper'

describe "teachers/edit.html.haml" do
  before(:each) do
    @teacher = assign(:teacher, stub_model(Teacher,
      :new_record? => false,
      :first_name => "MyString",
      :middle_name => "MyString",
      :last_name => "MyString",
      :number => 1
    ))
  end

  it "renders the edit teacher form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => teacher_path(@teacher), :method => "post" do
      assert_select "input#teacher_first_name", :name => "teacher[first_name]"
      assert_select "input#teacher_middle_name", :name => "teacher[middle_name]"
      assert_select "input#teacher_last_name", :name => "teacher[last_name]"
      assert_select "input#teacher_number", :name => "teacher[number]"
    end
  end
end
