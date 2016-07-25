class EventSet
  def initialize(event_string)
    split = event_string.split(' to ')
    @from = split[0]
    @to = split[1]
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
end
