require 'array_inject'

describe Array do
  context 'injecty method' do
    context 'when no block is given' do
      it 'should return nil for an empty array' do
        array = Array.new
        expect(array.injecty).to be_nil
      end

      it 'should raise an error for a non-empty array' do
        array = [1]
        expect { array.injecty }.to raise_error(LocalJumpError, 'no block given')
      end
    end

    context 'when a block is given' do
      it 'should return the block evaluation for an empty array' do
        array = Array.new
        expect(array.injecty { 1 } ).to eq 1
        expect(array.injecty { 500 / 5 }).to eq 100
      end

      it 'should apply the block to the element of singleton array' do
        array = [5]
        expect(array.injecty { 'a' }).to eq 'a'
        expect(array.injecty { |memo, num| memo * num }).to eq 25
        expect(array.injecty { |memo, num| memo + (num * 5) }).to eq 30
      end

      it 'should apply the block to all elements of an array' do
        array = [1, 2, 3]
        expect(array.injecty { 'a' }).to eq 'a'
        expect(array.injecty { |memo, num| memo * num }).to eq 6
        expect(array.injecty { |memo, num| memo + (num * 5) }).to eq 31
        array = ['a', 'b', 'c']
        expect(array.inject { |memo, char| memo << char }).to eq 'abc'
      end
    end
  end
end