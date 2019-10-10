require_relative '../lib/dark_trader'

describe "the go method" do
  it "should return not nil" do
    expect(go).not_to be_nil
  end
  it "should return an array with these values" do
    expect(go).to include("BTC")
  end
end
