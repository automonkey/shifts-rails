require 'rails_helper'

describe EventSet do

  ics_preamble =
    "BEGIN:VCALENDAR\n"\
    "VERSION:2.0\n"\
    "PRODID:-//Benyon.io//Shifts v1.0//aEN\n"\

  ics_postamble =
    "END:VCALENDAR"

  event_preamble =
    "BEGIN:VEVENT\n"

  event_postamble =
    "END:VEVENT\n"\

  it "should generate ics data from input from and to time" do
    test_event_set = EventSet.new(
      [{
        from: Time.utc(2016, 07, 25, 10, 00, 00),
        to: Time.utc(2016, 07, 25, 11, 00, 00)
      },
      {
        from: Time.utc(2016, 07, 26, 10, 00, 00),
        to: Time.utc(2016, 07, 26, 11, 00, 00)
      }]
    )

    expected =
      ics_preamble +
      event_preamble +
      "DTSTART:20160725T100000Z\n"\
      "DTEND:20160725T110000Z\n"\
      "SUMMARY:Some event\n" +
      event_postamble +
      event_preamble +
      "DTSTART:20160726T100000Z\n"\
      "DTEND:20160726T110000Z\n"\
      "SUMMARY:Some event\n" +
      event_postamble +
      ics_postamble

    expect(test_event_set.ics_data).to eq expected
  end
end
