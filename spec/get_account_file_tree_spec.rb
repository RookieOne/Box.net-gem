require 'spec_helper'

describe "get account tree" do
  before(:each) do
    # BoxnetApi::Client.API_KEY = ENV["BOXNET_API_KEY"]
    BoxnetApi::Client.API_KEY = "psslok0kb5vv4efa0jefydfppyzq7x65"
  end
  
 context "entire tree from root" do
   before(:each) do
     # @auth_token = "d402qzspvmk46zo6l59kcplaidmza76o"
     @auth_token = "ktoymf6umnn7tfiular81xb48n91zrlr"
     @result = BoxnetApi::Client.get_account_tree(@auth_token, "0")
   end
   it { @result.should_not be_nil }
 end
 
 # context "entire tree from root" do
 #   before(:each) do
 #     @auth_token = "vgp6hb8kjpxbctlmrrigdmvz2fyqpvib"
 #     @result = BoxnetApi::Client.get_account_tree(@auth_token, "0")
 #   end
 #   it { @result.should_not be_nil }
 # end
 
end