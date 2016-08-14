require 'event_entry_processing/lexer'
require 'event_entry_processing/parser'

class EventEntryProcessor

  def initialize(debug_enabled = false)
    @debug_enabled = debug_enabled
    @parser = EventTimesParser.new(DateEntriesLexer.new)
  end

  def process_input(input)
    return @parser.parse(input, @debug_enabled)
  end

end
