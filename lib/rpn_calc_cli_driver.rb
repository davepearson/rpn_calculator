##
# Provides a command line interface for the RPN Calculator
#

require_relative 'rpn_calc_text_adapter'

class RpnCalcCliDriver

  def self.process
    calc = RpnCalcTextAdapter.new

    # keep reading input until we get a quit command
    while(true) do

      # don't chomp yet - EOF will return nil, so chomp throws error
      print "> "
      input = gets

      # check for EOF or quit
      if input.nil? or input.chomp == 'q'
        # done
        break
      else
        # we got something, so chomp it and send it to the calculator
        stripped_input = input.chomp
        result = calc.process(stripped_input)
        puts result
      end 
    end

    # Exiting
    # lead with a newline so that we don't print it at the prompt if user entered EOF
    puts "\nGoodbye!"
  end

end