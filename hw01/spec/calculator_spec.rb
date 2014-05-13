require 'spec_helper'

class Calculator
  def add *arg
    result=0
    arg.each do |item|
      result+=item
    end
    result
  end

  def mult num_1,num_2
    raise TypeError unless num_1.is_a? Numeric and num_2.is_a? Numeric
    num_1*num_2
  end

end

describe Calculator do
  before :each do
    @calculator = Calculator.new
  end
  describe "#add" do
    context "with correct params" do
      it "should add two numbers" do
        expect(@calculator.add(1,3)).to eql(4)
        expect(@calculator.add(1,3,2.5,5)).to eql(11.5)
      end
    end

    context "with incorrect params" do
      it "should throw an error" do
        calc = Calculator.new
        expect {@calculator.add('string', 2)}.to raise_error TypeError
        expect {@calculator.add('string', true)}.to raise_error TypeError
      end
    end
  end

  describe "#mult" do
    context "with correct params" do
      it "should multiply two numbers" do
        expect(@calculator.mult(5,3)).to eql(15)
      end
    end
    context "with incorrect params" do
      it "should throw an error" do
        expect {@calculator.mult('string', true)}.to raise_error TypeError
        expect {@calculator.mult('string', 2)}.to raise_error TypeError
      end
    end
  end
end