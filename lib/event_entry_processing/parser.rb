require 'rly'
require 'rly/helpers'
require 'chronic'

class EventTimesParser < Rly::Yacc

  rule 'events : event
               | event events
               | event SEPARATOR events', &collect_to_a

  rule 'event : instant RANGE_OPERATOR instant' do |ev, d1, _, d2|
    ev.value = {
      from: d1.value,
      to: d2.value
    }
  end

  rule 'instant : INSTANT' do |ex, n|
    puts Chronic.parse(n.value)
    ex.value = Chronic.parse(n.value)
  end

end
