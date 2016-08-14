require 'event_entry_processing/lexer'
require 'event_entry_processing/parser'

class EventEntryProcessor

  def initialize
    @parser = EventTimesParser.new(DateEntriesLexer.new)
  end

  def process_input(input)
    return @parser.parse(input)
  end

end
