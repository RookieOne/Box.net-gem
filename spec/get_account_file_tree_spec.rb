require 'spec_helper'

describe "get account tree" do
  before(:each) do
    Boxnet::Client.API_KEY = ENV["BOXNET_API_KEY"]
    @auth_token = ENV["BOXNET_AUTHTOKEN"]
  end
  
 context "entire tree from root" do
   before(:each) do       
     @result = Boxnet::Client.get_account_tree(@auth_token, "0")
   end
   it { @result.should_not be_nil }
   it { @result.status.should == "listing_ok" }
   it { @result.file_tree.should_not be_nil }
   it { @result.file_tree.folders.count.should > 0 }
   it { @result.file_tree.folders.first.folders.first.files.count.should > 0 }
 end
end