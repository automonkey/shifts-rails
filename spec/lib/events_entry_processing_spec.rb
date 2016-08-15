require 'rails_helper'
require 'event_entry_processing/processor'

describe EventEntryProcessor do

  before(:each) do
    @p = EventEntryProcessor.new
  end

  it 'should process events with ISO 8601 time band' do
    input = '20160725T160000Z to 20160725T160000Z'

    expected = {
      from: Time.utc(2016, 07, 25, 16, 00, 00),
      to: Time.utc(2016, 07, 25, 16, 00, 00)
    }

    expect(@p.process_input(input)).to include expected
  end

  it 'should accept range with upper "to"' do

    expected = {
      from: Time.utc(2016, 07, 25, 16, 00, 00),
      to: Time.utc(2016, 07, 25, 16, 00, 00)
    }

    input = '20160725T160000Z TO 20160725T160000Z'
    expect(@p.process_input(input)).to include expected
  end

  context 'should process multiple event input' do

    e1 = '20160725T160000Z to 20160725T160000Z'
    e2 = '20160726T160000Z to 20160726T160000Z'

    array_with_both_events = [
      {
        from: Time.utc(2016, 07, 25, 16, 00, 00),
        to: Time.utc(2016, 07, 25, 16, 00, 00)
      },
      {
        from: Time.utc(2016, 07, 26, 16, 00, 00),
        to: Time.utc(2016, 07, 26, 16, 00, 00)
      }
    ]

    context 'with space between events' do
      it { expect(@p.process_input(e1 + ' ' + e2)).to eq(array_with_both_events) }
    end

    context 'with comma between events' do
      it { expect(@p.process_input(e1 + ',' + e2)).to eq(array_with_both_events) }
      it { expect(@p.process_input(e1 + ', ' + e2)).to eq(array_with_both_events) }
    end

    context 'with new line between events' do
      it { expect(@p.process_input(e1 + "\r\n" + e2)).to eq(array_with_both_events) }
    end

  end

end
