require './lib/rpn_calculator'

describe RpnCalculator do
  describe '#push' do
    it 'pushes a number on the stack' do
      calc = RpnCalculator.new
      expect(calc.push(2)).to eq(2)
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
  end

  describe '#-' do
    it 'handles -' do
      calc = RpnCalculator.new
      calc.push(3)
      calc.push(2)
      answer = calc.-

      expect(answer).to eq(1)
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
  end

  describe '#/' do
    it 'handles /' do
      calc = RpnCalculator.new
      calc.push(10)
      calc.push(2)
      answer = calc./

      expect(answer).to eq(5)
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
  end

  describe 'acceptance' do
    it 'takes a series of commands' do
      calc = RpnCalculator.new
      calc.push(2)
      calc.push(3.5)
      calc.+
      expect(calc.round).to eq(6)
    end
  end
end