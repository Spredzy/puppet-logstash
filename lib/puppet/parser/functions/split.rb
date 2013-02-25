# Function: split
#
#  This function take a string as input and return an array of value as output
#
module Puppet::Parser::Functions
  newfunction(:split, :type => :rvalue) do |arguments|
    arguments[0].split
  end
end
