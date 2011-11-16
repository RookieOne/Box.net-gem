require 'spec_helper'

describe Boxnet do
  before(:each) do
    Boxnet.API_KEY = ENV["BOXNET_API_KEY"]
  end

  describe "get ticket" do
    context "no API key" do
      before(:each) do
        Boxnet.API_KEY = ""
        @result = Boxnet.get_ticket
      end
      it { @result.should_not be_nil }
      it { @result["response"]["status"].should == "Wrong input" }
    end
    
    context "invalid API key" do
      before(:each) do
        Boxnet.API_KEY = "bad_api_key"
        @result = Boxnet.get_ticket
      end
      it { @result.should_not be_nil }
      it { @result["response"]["status"].should == "application_restricted" }
    end

    context "valid API key" do
      before(:each) do
        @result = Boxnet.get_ticket
      end
      it { @result.should_not be_nil }
      it { @result["response"]["status"].should == "get_ticket_ok" }
      it { @result["response"]["ticket"].should_not be_nil }      
    end    
  end
  
  describe "get auth token" do
    context "valid ticket" do
      before(:each) do
        ticket = ENV["BOXNET_TICKET"]
        @result = Boxnet.get_auth_token(ticket)
      end
      it { @result.should_not be_nil }
      it { @result["response"]["status"].should == "get_auth_token_ok" }
      it { @result["response"]["auth_token"].should_not be_nil }
      it { @result["response"]["user"].should_not be_nil }
    end    
  end

  describe "get account tree" do
    context "entire tree from root" do
      before(:each) do
        ticket = ENV["BOXNET_TICKET"]
        auth_token = ENV["BOXNET_AUTHTOKEN"]
        @result = Boxnet.get_account_tree(auth_token, "0")
      end
      it { @result.should_not be_nil }
      it { @result["response"]["status"].should == "listing_ok" }
      it { @result["response"]["tree"].should_not be_nil }
    end    
    
    context "get first level from root" do
      before(:each) do
        ticket = ENV["BOXNET_TICKET"]
        auth_token = ENV["BOXNET_AUTHTOKEN"]
        @result = Boxnet.get_account_tree(auth_token, "0", :onelevel => true)
      end
      it { @result.should_not be_nil }
      it { @result["response"]["status"].should == "listing_ok" }
      it { @result["response"]["tree"].should_not be_nil }
    end
    
    context "get no zip from root" do
      before(:each) do
        ticket = ENV["BOXNET_TICKET"]
        auth_token = ENV["BOXNET_AUTHTOKEN"]
        @result = Boxnet.get_account_tree(auth_token, "0", :nozip => true)
      end
      it { @result.should_not be_nil }
      it { @result["response"]["status"].should == "listing_ok" }
      it { @result["response"]["tree"].should_not be_nil }
    end
  end
  
end
