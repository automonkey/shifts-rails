require 'test_helper'

describe EventSet do
  include RSpec::Matchers

  ics_preamble =
      "BEGIN:VCALENDAR\n"\
      "VERSION:2.0\n"\
      "PRODID:-//Benyon.io//Shifts v1.0//aEN\n"\
      "BEGIN:VEVENT\n"

  ics_postamble =
      "END:VEVENT\n"\
      "END:VCALENDAR"

  it "should generate ics data from input from and to time" do
    test_event_set = EventSet.new('from_time', 'to_time')

    expected =
      ics_preamble +
      "DTSTART:from_time\n"\
      "DTEND:to_time\n"\
      "SUMMARY:Some event\n" +
      ics_postamble

    expect(test_event_set.ics_data).to eq expected
  end
end
