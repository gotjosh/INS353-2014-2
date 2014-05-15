class TriangleError < RuntimeError
end

class Triangle
  attr_reader :a, :b, :c

  def initialize(a,b,c)
    @a = a
    @b = b
    @c = c
    illegal?
  end

  def kind
    if equilateral?
      :equilateral
    elsif isosceles?
      :isosceles
    else
      :scalene
    end
  end

  private

  def sides
  end

  def equilateral?
    @a==@b and @a ==@c
  end

  def isosceles?
    @a == @b or @a == @c or @b == @c
  end

  def illegal?
    raise TriangleError if violates_inequality? or impossible_length_side?
    raise TriangleError unless @a.is_a? Numeric and @b.is_a? Numeric and @c.is_a? Numeric
  end

  def violates_inequality?
    if !(@a+@b > @c)
      true
    elsif !(@b+@c > @a)
      true
    elsif !(@c+@a > @b)
      true
    end
  end

  def impossible_length_side?
  end

end

describe Triangle do
  before { @triangle = Triangle.new 5,4,5 }

  subject { @triangle}
  it { should respond_to(:kind, :a, :b, :c)}
  it { should_not respond_to(:sides, :equilateral, :isosceles, :illegal,:violates_inequality, :impossible_length_side) }

  context "with incorrect params" do
    it "should throw an error" do
      expect {Triangle.new(6,8,16)}.to raise_error TriangleError
    end
  end

  describe "#kind" do
    context "with correct params" do
      it "should be true" do
        expect(Triangle.new(50,50,50).kind).to eql(:equilateral)
        expect(Triangle.new(50,30,50).kind).to eql(:isosceles)
        expect(Triangle.new(50,40,30).kind).to eql(:scalene)
      end
    end
  end
end
