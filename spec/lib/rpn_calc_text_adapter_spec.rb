require './lib/rpn_calc_text_adapter'

describe RpnCalcTextAdapter do
  describe '#process' do
    it 'pushes a number' do
      adapter = RpnCalcTextAdapter.new
      result = adapter.process("2")
      expect(result).to eq("2")
    end

    it 'adds' do
      adapter = RpnCalcTextAdapter.new
      adapter.process("2")
      adapter.process("3")
      result = adapter.process("+")
      expect(result).to eq("5")
    end

    it 'rejects invalid input' do
      adapter = RpnCalcTextAdapter.new
      result = adapter.process("asdf")
      expect(result).to eq("asdf is not a number")
    end

    it 'handles multiple tokens in a string' do
      adapter = RpnCalcTextAdapter.new
      result = adapter.process("2 3 +")
      expect(result).to eq("5")
    end

    it 'handles errors from not enough operands on stack' do
      adapter = RpnCalcTextAdapter.new
      adapter.process("2")
      result = adapter.process("+")
      expect(result).to eq("Not enough numbers on stack")
    end
  end

  describe '#numeric' do
    it 'returns true for a number' do
      adapter = RpnCalcTextAdapter.new

      expect(adapter.numeric?("2")).to be true
      expect(adapter.numeric?("2.5")).to be true
      expect(adapter.numeric?("2.0")).to be true
      expect(adapter.numeric?("-4.9863")).to be true

      expect(adapter.numeric?("")).to be false
      expect(adapter.numeric?("1text")).to be false
      expect(adapter.numeric?("two")).to be false
      expect(adapter.numeric?(" ")).to be false
    end
  end
end
