class EventSet

  def initialize(events)
    @from = iso8601_string(events[0][:from])
    @to = iso8601_string(events[0][:to])
  end

  def ics_data()
    return \
      "BEGIN:VCALENDAR\n"\
      "VERSION:2.0\n"\
      "PRODID:-//Benyon.io//Shifts v1.0//aEN\n"\
      "BEGIN:VEVENT\n"\
      "DTSTART:#{@from}\n"\
      "DTEND:#{@to}\n"\
      "SUMMARY:Some event\n"\
      "END:VEVENT\n"\
      "END:VCALENDAR"
  end

  private
  def iso8601_string(time)
    return time.strftime("%Y%m%dT%H%M%SZ")
  end

end
