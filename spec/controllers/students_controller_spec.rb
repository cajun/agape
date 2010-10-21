require 'spec_helper'

describe StudentsController do

  def mock_student_save(return_value)
    return @mock_student if @mock_student
    mock(new_student).save { return_value }
    stub(new_student).new_record? { !return_value }
    @mock_student ||= new_student
  end

  def mock_student_update_attributes(options, return_value)
    return @mock_student if @mock_student
    mock(new_student).update_attributes( options ) { return_value }
    stub(new_student).new_record? { false }
    @mock_student ||= new_student
  end

  def new_student
    @new_student ||= Student.new
  end

  describe "GET index" do
    it "assigns all students as @students" do
      stub(Student).all { [new_student] }
      get :index
      assigns(:students).should eq([new_student])
    end
  end

  describe "GET show" do
    it "assigns the requested student as @student" do
      stub(Student).find("37") { new_student }
      get :show, :id => "37"
      assigns(:student).should be(new_student)
    end
  end

  describe "GET new" do
    it "assigns a new student as @student" do
      temp = new_student # so we don't double mock 'new'
      stub(Student).new { temp }
      get :new
      assigns(:student).should be(temp)
    end
  end

  describe "GET edit" do
    it "assigns the requested student as @student" do
      stub(Student).find("37") { new_student }
      get :edit, :id => "37"
      assigns(:student).should be(new_student)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      before(:each) do
        @mock = mock_student_save true
      end

      it "assigns a newly created student as @student" do
        mock(Student).new({'these' => 'params'}) { @mock }
        post :create, :student => {'these' => 'params'}
        assigns(:student).should be(@mock)
      end

      it "redirects to the created student" do
        mock(Student).new({}) { @mock }
        post :create, :student => {}
        response.should redirect_to(student_url(@mock))
      end
    end

    describe "with invalid params" do
      before(:each) do
        @mock = mock_student_save false
      end

      it "assigns a newly created but unsaved student as @student" do
        stub(Student).new({'these' => 'params'}) { @mock }
        post :create, :student => {'these' => 'params'}
        assigns(:student).should be(@mock)
      end

      it "re-renders the 'new' template" do
        stub(Student).new { @mock }
        post :create, :student => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      before(:each) do
        @mock = mock_student_update_attributes( {'these' => 'params'}, true)
      end

      it "updates the requested student" do
        mock(Student).find("37") { @mock }
        put :update, :id => "37", :student => {'these' => 'params'}
      end

      it "assigns the requested student as @student" do
        mock( Student ).find('1') { @mock }
        put :update, :id => "1", :student => {'these' => 'params'}
        assigns(:student).should be(@mock)
      end

      it "redirects to the student" do
        mock( Student ).find('1') { @mock }
        put :update, :id => "1", :student => {'these' => 'params'}
        response.should redirect_to(student_url(@mock))
      end
    end

    describe "with invalid params" do
      before(:each) do
        @student = mock_student_update_attributes( nil, false)
      end

      it "assigns the student as @student" do
        mock( Student ).find('1') { @student }
        put :update, :id => "1"
        assigns(:student).should be(@student)
      end

      it "re-renders the 'edit' template" do
        mock( Student ).find('1') { @student }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    before(:each) do
      mock( Student ).find('37') { mock(new_student).destroy{true} }
    end

    it "destroys the requested student" do
      delete :destroy, :id => "37"
    end

    it "redirects to the students list" do
      delete :destroy, :id => "37"
      response.should redirect_to(students_url)
    end
  end
end
