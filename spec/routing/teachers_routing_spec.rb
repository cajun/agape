require "spec_helper"

describe TeachersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/teachers" }.should route_to(:controller => "teachers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/teachers/new" }.should route_to(:controller => "teachers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/teachers/1" }.should route_to(:controller => "teachers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/teachers/1/edit" }.should route_to(:controller => "teachers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/teachers" }.should route_to(:controller => "teachers", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/teachers/1" }.should route_to(:controller => "teachers", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/teachers/1" }.should route_to(:controller => "teachers", :action => "destroy", :id => "1")
    end

  end
end
