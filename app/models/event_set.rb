class EventSet
  def initialize(from, to)
    @ics_data =
      "BEGIN:VCALENDAR\n"\
      "VERSION:2.0\n"\
      "PRODID:-//hacksw/handcal//NONSGML v1.0//EN\n"\
      "BEGIN:VEVENT\n"\
      "DTSTART:#{from}\n"\
      "DTEND:#{to}\n"\
      "SUMMARY:Some event\n"\
      "END:VEVENT\n"\
      "END:VCALENDAR"
  end

  def ics_data()
    return @ics_data
  end
end
