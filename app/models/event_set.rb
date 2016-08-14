class EventSet

  def initialize(events)
    @events = events
  end

  def ics_data()
    return \
      "BEGIN:VCALENDAR\n"\
      "VERSION:2.0\n"\
      "PRODID:-//Benyon.io//Shifts v1.0//aEN\n"\
      "#{ics_events()}"\
      "END:VCALENDAR"
  end

  private
  def ics_events()
    return @events.map { |e| ics_event_string(e) }.join("")
  end

  def ics_event_string(event)
    from = iso8601_string(event[:from])
    to = iso8601_string(event[:to])

    return \
      "BEGIN:VEVENT\n"\
      "DTSTART:#{from}\n"\
      "DTEND:#{to}\n"\
      "SUMMARY:Some event\n"\
      "END:VEVENT\n"\
  end

  def iso8601_string(time)
    return time.strftime("%Y%m%dT%H%M%SZ")
  end

end
