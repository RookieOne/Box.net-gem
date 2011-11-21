require 'spec_helper'

describe Boxnet do
  before(:each) do
    Boxnet::Client.API_KEY = ENV["BOXNET_API_KEY"]
  end

  describe "get ticket" do
    context "no API key" do
      before(:each) do
        Boxnet::Client.API_KEY = ""
        @result = Boxnet::Client.get_ticket
      end
      it { @result.should_not be_nil }
      it { @result["response"]["status"].should == "Wrong input" }
    end
      
    context "invalid API key" do
      before(:each) do
        Boxnet::Client.API_KEY = "bad_api_key"
        @result = Boxnet::Client.get_ticket
      end
      it { @result.should_not be_nil }
      it { @result["response"]["status"].should == "application_restricted" }
    end
  
    context "valid API key" do
      before(:each) do
        @result = Boxnet::Client.get_ticket
        puts "ticket"
        puts @result.inspect
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
        @result = Boxnet::Client.get_auth_token(ticket)
      end
      it { @result.should_not be_nil }
      it { @result["response"]["status"].should == "get_auth_token_ok" }
      it { @result["response"]["auth_token"].should_not be_nil }
      it { @result["response"]["user"].should_not be_nil }
    end    
  end

end
