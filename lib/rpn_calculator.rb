##
# Implements a Reverse Polish Notation caclulator
#

class RpnCalculator

  VALID_OPS = ['+', '-', '*', '/', 'round']

  ##
  # Initialize our calculator
  # Simply instantiate our stack
  def initialize
    @stack = []
  end

  ##
  # Push a number onto the stack
  #
  def push(num)
    @stack << num

    return num
  end

  ##
  # Addition
  #
  def +
    raise StandardError.new("Not enough numbers on stack") if @stack.length<2
    num1 = pop
    num2 = pop
    result = num2 + num1
    push(result)
    return result
  end

  ##
  # Subtraction
  #
  def -
    raise StandardError.new("Not enough numbers on stack") if @stack.length<2
    num1 = pop
    num2 = pop
    result = num2 - num1
    push(result)
    return result
  end

  ##
  # Multiplication
  #
  def *
    raise StandardError.new("Not enough numbers on stack") if @stack.length<2
    num1 = pop
    num2 = pop
    result = num2 * num1
    push(result)
    return result
  end

  ##
  # Division
  #
  def /
    raise StandardError.new("Not enough numbers on stack") if @stack.length<2
    num1 = pop
    num2 = pop
    result = num2 / num1
    push(result)
    return result
  end

  ##
  # Round the top number on the stack
  def round
    raise StandardError.new("Not enough numbers on stack") if @stack.length<1
    num = pop
    result = num.round
    push(result)
    return result
  end

  private

  ##
  # Have a private method for the pop in case we ever change
  # how our stack works
  def pop
    return @stack.pop
  end
end