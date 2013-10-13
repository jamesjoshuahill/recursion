require 'sum_array'

describe 'Method to sum an array of numbers' do

  it 'should return zero for an empty array' do
    expect(sum([])).to eq 0
  end

  it 'should return the element for an array with one element' do
    expect(sum([5])).to eq 5
  end

  it 'should return the sum of an array with two or more elements' do
    expect(sum([5, 12, 25, 7, 43])).to eq 92
  end

end
