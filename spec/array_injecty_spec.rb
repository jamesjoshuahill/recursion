require 'array_injecty'

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

      context 'should return the block evaluation for an empty array' do

        let(:array) { Array.new }

        it 'when passing one' do
          expect(array.injecty { 1 } ).to eq 1
        end

        it 'when passing in a computation' do
          expect(array.injecty { 500 / 5 }).to eq 100
        end

      end

      context 'should apply the block to the element of singleton array' do

        let(:array) { [5] }

        it 'when passing a block with a string' do
          expect(array.injecty { 'a' }).to eq 'a'
        end

        it 'when passing a block with a multiplication' do
          expect(array.injecty { |memo, num| memo * num }).to eq 25
        end

        it 'when passing a block with a computation' do
          expect(array.injecty { |memo, num| memo + (num * 5) }).to eq 30
        end

      end

      context 'should apply the block to all elements of an array' do

        let(:array) { [1, 2, 3] }

        it 'when passing a block with a string' do
          expect(array.injecty { 'a' }).to eq 'a'
        end

        it 'when passing a block with a multiplication' do
          expect(array.injecty { |memo, num| memo * num }).to eq 6
        end

        it 'when passing a block with a computation' do
          expect(array.injecty { |memo, num| memo + (num * 5) }).to eq 31
        end

        it 'when passing a block to concatenate strings' do
          array = ['a', 'b', 'c']
          expect(array.inject { |memo, char| memo << char }).to eq 'abc'
        end

      end

    end

  end

end
