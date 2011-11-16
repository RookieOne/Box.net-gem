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
    end    
  end

end
