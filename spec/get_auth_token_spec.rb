require 'spec_helper'

describe "get account tree" do
  context "valid ticket" do
    before(:each) do
      Boxnet::Client.API_KEY = "m4o9591n3z2k41gks0gr69mayvfbg6gz"
      ticket = "1csa8hpmko9z838m7s76qbqrmrv0bk0q"
      @result = Boxnet::Client.get_auth_token(ticket)
    end
    it { @result.should_not be_nil }
    it { @result["response"]["status"].should == "get_auth_token_ok" }
    it { @result["response"]["auth_token"].should_not be_nil }
    it { @result["response"]["user"].should_not be_nil }
  end
end