require 'rly'

class DateEntriesLexer < Rly::Lex

  ignore ' '

  token :TO, /to/

  token :ISO_8601_DATE, /\d{8}T\d{6}Z/

  token :SEPARATOR, /,|\r\n/

end
