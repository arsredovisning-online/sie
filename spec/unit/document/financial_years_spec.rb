require "spec_helper"

describe Sie::Document::FinancialYears, ".between" do
  it "gives us the financial years between from_date and to_date" do
    Sie::Document::FinancialYears.between(
      1,
      Date.new(2011, 9, 1),
      Date.new(2012, 12, 31)
    ).should == [
      Date.new(2011, 9, 1)..Date.new(2011, 12, 31),
      Date.new(2012, 1, 1)..Date.new(2012, 12, 31),
    ]
  end

  it "gives us the financial years between from_date and to_date" do
    Sie::Document::FinancialYears.between(
      1,
      Date.new(2011, 9, 1),
      Date.new(2013, 12, 31)
    ).should == [
      Date.new(2011, 9, 1)..Date.new(2011, 12, 31),
      Date.new(2012, 1, 1)..Date.new(2012, 12, 31),
      Date.new(2013, 1, 1)..Date.new(2013, 12, 31),
    ]
  end

  it "gives us the financial years between from_date and to_date with a different financial year start month" do
    Sie::Document::FinancialYears.between(
      5,
      Date.new(2011, 9, 1),
      Date.new(2014, 1, 10)
    ).should == [
      Date.new(2011, 9, 1)..Date.new(2012, 4, 30),
      Date.new(2012, 5, 1)..Date.new(2013, 4, 30),
      Date.new(2013, 5, 1)..Date.new(2014, 1, 10),
    ]
  end
end