require 'rails_helper'
require 'event_entry_processing/processor'

describe EventEntryProcessor do

  before(:each) do
    @p = EventEntryProcessor.new(true)
  end

  it 'should process events with time band' do
    input = '25/07/2016 16:00:00 to 25/07/2012 16:00:00'

    expected = {
      from: Time.utc(2016, 07, 25, 16, 00, 00),
      to: Time.utc(2016, 07, 25, 16, 00, 00)
    }

    expect(@p.process_input(input)).to include expected
  end

#  it 'should accept range with upper "to"' do
#
#    expected = {
#      from: Time.utc(2016, 07, 25, 16, 00, 00),
#      to: Time.utc(2016, 07, 25, 16, 00, 00)
#    }
#
#    input = '20160725T160000Z TO 20160725T160000Z'
#    expect(@p.process_input(input)).to include expected
#  end
#
#  context 'should process multiple event input' do
#
#    e1 = '20160725T160000Z to 20160725T160000Z'
#    e2 = '20160726T160000Z to 20160726T160000Z'
#
#    array_with_both_events = [
#      {
#        from: Time.utc(2016, 07, 25, 16, 00, 00),
#        to: Time.utc(2016, 07, 25, 16, 00, 00)
#      },
#      {
#        from: Time.utc(2016, 07, 26, 16, 00, 00),
#        to: Time.utc(2016, 07, 26, 16, 00, 00)
#      }
#    ]
#
#    context 'with space between events' do
#      it { expect(@p.process_input(e1 + ' ' + e2)).to eq(array_with_both_events) }
#    end
#
#    context 'with comma between events' do
#      it { expect(@p.process_input(e1 + ',' + e2)).to eq(array_with_both_events) }
#      it { expect(@p.process_input(e1 + ', ' + e2)).to eq(array_with_both_events) }
#    end
#
#    context 'with new line between events' do
#      it { expect(@p.process_input(e1 + "\r\n" + e2)).to eq(array_with_both_events) }
#    end
#
#  end
#
#  context 'should reject invalid iso 8601 dates' do
#    it 'something' do
#      test = @p.process_input('20160931T160000Z')
#      puts test.inspect
#    end
#  end

end
