require 'spec_helper'

describe TeachersController do

  def mock_teacher(stubs={})
    @mock_teacher ||= mock_model(Teacher, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all teachers as @teachers" do
      Teacher.stub(:all) { [mock_teacher] }
      get :index
      assigns(:teachers).should eq([mock_teacher])
    end
  end

  describe "GET show" do
    it "assigns the requested teacher as @teacher" do
      Teacher.stub(:find).with("37") { mock_teacher }
      get :show, :id => "37"
      assigns(:teacher).should be(mock_teacher)
    end
  end

  describe "GET new" do
    it "assigns a new teacher as @teacher" do
      Teacher.stub(:new) { mock_teacher }
      get :new
      assigns(:teacher).should be(mock_teacher)
    end
  end

  describe "GET edit" do
    it "assigns the requested teacher as @teacher" do
      Teacher.stub(:find).with("37") { mock_teacher }
      get :edit, :id => "37"
      assigns(:teacher).should be(mock_teacher)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created teacher as @teacher" do
        Teacher.stub(:new).with({'these' => 'params'}) { mock_teacher(:save => true) }
        post :create, :teacher => {'these' => 'params'}
        assigns(:teacher).should be(mock_teacher)
      end

      it "redirects to the created teacher" do
        Teacher.stub(:new) { mock_teacher(:save => true) }
        post :create, :teacher => {}
        response.should redirect_to(teacher_url(mock_teacher))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved teacher as @teacher" do
        Teacher.stub(:new).with({'these' => 'params'}) { mock_teacher(:save => false) }
        post :create, :teacher => {'these' => 'params'}
        assigns(:teacher).should be(mock_teacher)
      end

      it "re-renders the 'new' template" do
        Teacher.stub(:new) { mock_teacher(:save => false) }
        post :create, :teacher => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested teacher" do
        Teacher.should_receive(:find).with("37") { mock_teacher }
        mock_teacher.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :teacher => {'these' => 'params'}
      end

      it "assigns the requested teacher as @teacher" do
        Teacher.stub(:find) { mock_teacher(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:teacher).should be(mock_teacher)
      end

      it "redirects to the teacher" do
        Teacher.stub(:find) { mock_teacher(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(teacher_url(mock_teacher))
      end
    end

    describe "with invalid params" do
      it "assigns the teacher as @teacher" do
        Teacher.stub(:find) { mock_teacher(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:teacher).should be(mock_teacher)
      end

      it "re-renders the 'edit' template" do
        Teacher.stub(:find) { mock_teacher(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested teacher" do
      Teacher.should_receive(:find).with("37") { mock_teacher }
      mock_teacher.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the teachers list" do
      Teacher.stub(:find) { mock_teacher }
      delete :destroy, :id => "1"
      response.should redirect_to(teachers_url)
    end
  end

end
