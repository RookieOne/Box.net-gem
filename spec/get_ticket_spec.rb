require 'spec_helper'

describe "get account tree" do
  before(:each) do
    Boxnet::Client.API_KEY = "m4o9591n3z2k41gks0gr69mayvfbg6gz"
    @ticket = Boxnet::Client.get_ticket
  end
  
  it { @ticket.should_not be_nil }
end