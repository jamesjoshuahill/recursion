require 'palindrome_array'

describe 'method to determine whether an array is a palindrome' do
  it 'should not consider an empty array a palindrome' do
    expect(palindrome?([])).to be_false
  end

  it 'should consider an array with one element a palindrome' do
    expect(palindrome?([1])).to be_true
  end

  it 'should consider an array of two equal elements a palindrome' do
    expect(palindrome?([1, 1])).to be_true
  end

  it 'should not consider an array of two different elements a palindrome' do
    expect(palindrome?([1, 2])).to be_false
  end

  it 'should determine if an array of two or more elements is a palindrome' do
    expect(palindrome?([1, 2, 3, 2, 1])).to be_true
  end

  it 'should determine if an array of two or more elements is not a palindrome' do
    expect(palindrome?([1, 3, 7, 8, 3, 1])).to be_false
  end
end