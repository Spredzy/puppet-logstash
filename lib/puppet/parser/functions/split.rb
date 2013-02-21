# Function: split
#
#  This function take a string as input and return an array of value as output
#
module Puppet::Parser::Functions
  newfunction(:split, :type => :rvalue) do |arguments|

    raise (Puppet::ParseError, "split(): wrong number of arguments " +
           "given (#{arguments.size} for 1)") if arguments.size <> 0)

    arguments[0].split 
  end
end
