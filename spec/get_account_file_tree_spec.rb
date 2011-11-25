require 'spec_helper'

describe "get account tree" do
  before(:each) do
    Boxnet::Client.API_KEY = ENV["BOXNET_API_KEY"]
  end
  
 context "entire tree from root" do
   before(:each) do
     @auth_token = "d402qzspvmk46zo6l59kcplaidmza76o"
     @result = Boxnet::Client.get_account_tree(@auth_token, "0")
   end
   it { @result.should_not be_nil }
 end
 
 context "entire tree from root" do
   before(:each) do
     @auth_token = "vgp6hb8kjpxbctlmrrigdmvz2fyqpvib"
     @result = Boxnet::Client.get_account_tree(@auth_token, "0")
   end
   it { @result.should_not be_nil }
 end
 
end