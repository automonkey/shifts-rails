require 'rly'

class DateEntriesLexer < Rly::Lex

  # want this to be preferred above any match containing 'to' below
  token :RANGE_OPERATOR, /to|TO/

  token :SEPARATOR, /,|\r\n/

  token :INSTANT, /.+/

end
