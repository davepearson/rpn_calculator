##
# Adapter class that takes text input, processes it, then passes it along
# to the RPN Calculator
#

require_relative 'rpn_calculator'


class RpnCalcTextAdapter
  ##
  # Initialize our adapter.  All that needs to be done is to instantiate
  # an instance of the RPN Calculator
  #
  def initialize
    @calc = RpnCalculator.new
  end

  ##
  # Process text input
  # It takes a string input, then returns the result as a string
  def process(long_text)
    result = ""
    symbol_array = long_text.split
    symbol_array.each do |text|
      # see if it is one of our commands
      if RpnCalculator::VALID_OPS.include?(text)
        # catch in case there are not enough arguments on stack
        begin
          result = @calc.public_send(text)
          if result.is_a? Numeric
            result = "#{format("%g", result)}"
          end
        rescue => e
          result = e.message
        end
      else
        # got here so assume it is a number.  It will throw an exception if not
        begin
          num = @calc.push(Float(text))
          result = "#{format("%g", num)}"
        rescue => e
          result = "#{text} is not a number"
        end
      end
    end

    return result
  end

  def numeric?(s)
    Float(s) != nil rescue false
  end

end