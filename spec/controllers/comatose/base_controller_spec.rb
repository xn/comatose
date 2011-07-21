describe RecordingsController do

  describe "a route" do
    assert_routing { :path => "/en", :method => :get }, { :controller => "comatose/base", :action => "show" }
  end
  #describe "GET index" do
  #  it "assigns all recordings as @recordings" do
  #    Recording.stub(:find).with(:all).and_return([mock_recording])
  #    get :index
  #    assigns[:recordings].should == [mock_recording]
  #  end
  #end

end
