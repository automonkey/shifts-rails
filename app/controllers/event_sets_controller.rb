class EventSetsController < ApplicationController
  def new
  end

  def create
    event = params[:event_set]
    event_set = EventSet.new(event[:from_date], event[:to_date])
    send_data(event_set.ics_data, :filename => "events.ics" )
  end
end
