class EventSetsController < ApplicationController
  def new
  end

  def create
    event_set = EventSet.new(params[:event_set][:event_string])
    send_data(event_set.ics_data, :filename => "events.ics" )
  end
end
