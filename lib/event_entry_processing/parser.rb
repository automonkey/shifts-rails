require "rly/helpers"

class EventTimesParser < Rly::Yacc

  rule 'events : event
               | event events
               | event SEPARATOR events', &collect_to_a

  rule 'event : date RANGE_OPERATOR date' do |ev, d1, _, d2|
    ev.value = {
      from: d1.value,
      to: d2.value
    }
  end

  rule 'date : ISO_8601_DATE' do |ex, n|
    ex.value = Time.parse(n.value)
  end

end
