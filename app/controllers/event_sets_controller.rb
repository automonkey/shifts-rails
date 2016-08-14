require 'event_entry_processing/processor'

class EventSetsController < ApplicationController

  def initialize
    @input_parser = EventEntryProcessor.new
  end

  def create
    events = @input_parser.process_input(params[:event_set][:event_string])
    event_set = EventSet.new(events)
    send_data(event_set.ics_data, :filename => "events.ics" )
  end

end
