require_relative '../lib/townhall'

describe "the get_email method" do
  it "should return an array" do
    expect(get_email("http://www.annuaire-des-mairies.com/95/avernes.html")).to be_instance_of Array
end
end
