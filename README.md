# RPN Calculator Sample
This provides a sample implementation of a Reverse Polish Notation calculator, executable from the command line.

To run the calculator: `./bin/rpncalc_script.rb`

## Implementation Notes
- The calculator itself is implemented in `lib/rpn_calculator.rb`
- It uses an adapter to take text and map it to the correct calculator methods, in `lib/rpn_calc_text_adapter.rb`
- The REPL for the command line input/output is implemented in `lib/rpn_calc_cli_driver.rb` 
- At some point, if a socket or file implementation is to be developed, it would be in a new driver class.  At that point, it would also make sense to move all of the drivers into a new drivers directory underneath lib.  However, at this point, since there is only one, it is in the same directory as the calculator.