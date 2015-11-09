require_relative '../lib/multable'

describe Multable, '#new' do

  it "should return and empty array if given an empty array" do
    expect(Multable.new([]).to_a ).to eq []
  end

  it "should create a 2x2 multiplication table in the form of an array" do
    expect(Multable.new([1]).to_a ).to eq [[nil,1],
                                             [1,1]]
  end

  it "should create a 3x3 multiplication table in the form of an array" do
    expect(Multable.new([1,2]).to_a ).to eq [[nil,1,2],
                                               [1,1,2],
                                               [2,2,4]]
  end

  it "should create a 4x4 multiplication table in the form of an array" do
    expect(Multable.new([1,2,3,4]).to_a ).to eq [[nil,1,2,3,4],
                                                   [1,1,2,3,4],
                                                   [2,2,4,6,8],
                                                   [3,3,6,9,12],
                                                   [4,4,8,12,16]]
  end

end
