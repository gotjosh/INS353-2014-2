class TriangleError < RuntimeError
end

class Triangle
  attr_reader :a, :b, :c

  def initialize(a,b,c)
    @a = a
    @b = b
    @c = c
  end

  private

end

describe Triangle do
  before { @triangle = Triangle.new 5,4,5 }

  subject { @triangle}
  it { should respond_to(:kind)}
  it { should_not respond_to(:sides, :equilateral, :isosceles, :illegal,:violates_inequality, :impossible_length_side) }

  describe "kind" do
    it "should be true" do
    end
  end
end
