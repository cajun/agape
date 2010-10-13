require 'spec_helper'

describe "students/edit.html.haml" do
  before(:each) do
    @student = assign(:student, stub_model(Student,
      :new_record? => false,
      :first_name => "MyString",
      :middle_name => "MyString",
      :last_name => "MyString",
      :number => 1
    ))
  end

  it "renders the edit student form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => student_path(@student), :method => "post" do
      assert_select "input#student_first_name", :name => "student[first_name]"
      assert_select "input#student_middle_name", :name => "student[middle_name]"
      assert_select "input#student_last_name", :name => "student[last_name]"
      assert_select "input#student_number", :name => "student[number]"
    end
  end
end
