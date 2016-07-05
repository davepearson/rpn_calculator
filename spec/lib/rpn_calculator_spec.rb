require './lib/rpn_calculator'

describe RpnCalculator do
  describe '#push' do
    it 'pushes a number on the stack' do
      calc = RpnCalculator.new
      answer = calc.push(2)
      expect(answer).to eq(2)
    end
  end

  describe '#+' do
    it 'handles +' do
      calc = RpnCalculator.new
      calc.push(2)
      calc.push(3)
      answer = calc.+

      expect(answer).to eq(5)
    end

    it 'raises exception if not enough arguments' do
      calc = RpnCalculator.new
      calc.push(7)
      expect { calc.+ }.to raise_error(StandardError)
    end
  end

  describe '#-' do
    it 'handles -' do
      calc = RpnCalculator.new
      calc.push(3)
      calc.push(2)
      answer = calc.-

      expect(answer).to eq(1)
    end

    it 'raises exception if not enough arguments' do
      calc = RpnCalculator.new
      calc.push(7)
      expect { calc.- }.to raise_error(StandardError)
    end
  end

  describe '#*' do
    it 'handles *' do
      calc = RpnCalculator.new
      calc.push(2)
      calc.push(3)
      answer = calc.*

      expect(answer).to eq(6)
    end

    it 'raises exception if not enough arguments' do
      calc = RpnCalculator.new
      calc.push(7)
      expect { calc.* }.to raise_error(StandardError)
    end
  end

  describe '#/' do
    it 'handles /' do
      calc = RpnCalculator.new
      calc.push(10)
      calc.push(2)
      answer = calc./

      expect(answer).to eq(5)
    end

    it 'raises exception if not enough arguments' do
      calc = RpnCalculator.new
      calc.push(7)
      expect { calc./ }.to raise_error(StandardError)
    end

    it 'raises exception if divide by 0' do
      calc = RpnCalculator.new
      calc.push(7)
      calc.push(0)
      expect { calc./ }.to raise_error(StandardError)
    end

    it 'raises exception if divide by 0.0' do
      calc = RpnCalculator.new
      calc.push(7)
      calc.push(0.0)
      expect { calc./ }.to raise_error(StandardError)
    end
  end

  describe '#round' do
    it 'rounds correctly' do
      calc = RpnCalculator.new

      calc.push(2)
      answer = calc.round
      expect(answer).to eq(2)

      calc.push(3.1)
      answer = calc.round
      expect(answer).to eq(3)

      calc.push(4.5)
      answer = calc.round
      expect(answer).to eq(5)

      calc.push(5.9)
      answer = calc.round
      expect(answer).to eq(6)

      calc.push(-2)
      answer = calc.round
      expect(answer).to eq(-2)

      calc.push(-4.5)
      answer = calc.round
      # this should be -5 since ruby rounds away from 0
      expect(answer).to eq(-5)
    end

    it 'raises exception if not enough arguments' do
      calc = RpnCalculator.new
      expect { calc.round }.to raise_error(StandardError)
    end
  end

  describe 'acceptance' do
    it 'takes a series of commands' do
      calc = RpnCalculator.new
      calc.push(2)
      calc.push(3.5)
      calc.+
      answer = calc.round
      expect(answer).to eq(6)
    end
  end
end