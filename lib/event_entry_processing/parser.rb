class EventTimesParser < Rly::Yacc

  rule 'event : date TO date' do |ev, d1, _, d2|
    ev.value = [{
      from: d1.value,
      to: d2.value
    }]
  end

  rule 'date : ISO_8601_DATE' do |ex, n|
    ex.value = Time.parse(n.value)
  end

end
