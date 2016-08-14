require 'rails_helper'
require 'event_entry_processing/processor'

describe EventEntryProcessor do

  p = EventEntryProcessor.new

  it 'should process events with ISO 8601 time band' do
    input = '20160725T160000Z to 20160725T160000Z'

    expected = {
      from: Time.utc(2016, 07, 25, 16, 00, 00),
      to: Time.utc(2016, 07, 25, 16, 00, 00)
    }

    expect(p.process_input(input)).to include expected
  end

  it 'should process multiuple events in input' do
    input = '20160725T160000Z to 20160725T160000Z 20160726T160000Z to 20160726T160000Z'

    expected = [
      {
        from: Time.utc(2016, 07, 25, 16, 00, 00),
        to: Time.utc(2016, 07, 25, 16, 00, 00)
      },
      {
        from: Time.utc(2016, 07, 26, 16, 00, 00),
        to: Time.utc(2016, 07, 26, 16, 00, 00)
      }
    ]

    expect(p.process_input(input)).to eq(expected)
  end

end