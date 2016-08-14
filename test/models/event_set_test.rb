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
    test_event_set = EventSet.new(
      [{
        from: Time.utc(2016, 07, 25, 10, 00, 00),
        to: Time.utc(2016, 07, 25, 11, 00, 00)
      }]
    )

    expected =
      ics_preamble +
      "DTSTART:20160725T100000Z\n"\
      "DTEND:20160725T110000Z\n"\
      "SUMMARY:Some event\n" +
      ics_postamble

    expect(test_event_set.ics_data).to eq expected
  end
end
