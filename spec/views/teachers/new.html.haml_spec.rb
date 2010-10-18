require 'spec_helper'

describe "teachers/new.html.haml" do
  before(:each) do
    assign(:teacher, stub_model(Teacher,
      :first_name => "MyString",
      :middle_name => "MyString",
      :last_name => "MyString",
      :number => 1
    ).as_new_record)
  end

  it "renders new teacher form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => teachers_path, :method => "post" do
      assert_select "input#teacher_first_name", :name => "teacher[first_name]"
      assert_select "input#teacher_middle_name", :name => "teacher[middle_name]"
      assert_select "input#teacher_last_name", :name => "teacher[last_name]"
      assert_select "input#teacher_number", :name => "teacher[number]"
    end
  end
end
