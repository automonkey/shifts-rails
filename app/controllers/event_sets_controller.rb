class EventSetsController < ApplicationController
  def new
  end

  def create
    ics_data =
      "BEGIN:VCALENDAR\n"\
      "VERSION:2.0\n"\
      "PRODID:-//hacksw/handcal//NONSGML v1.0//EN\n"\
      "BEGIN:VEVENT\n"\
      "DTSTART:20160702T160000\n"\
      "DTEND:20160702T170000\n"\
      "SUMMARY:Some event\n"\
      "END:VEVENT\n"\
      "END:VCALENDAR"

    send_data( ics_data, :filename => "events.ics" )
  end
end
