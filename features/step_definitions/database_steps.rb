require "bigdecimal"

Then('a payment with amount {string} should exist in the database') do |amount|
  assert(Payment.exists?(amount: BigDecimal(amount)))
end

Then('a payment with:') do |table|
  table.hashes.each do |row|
    attributes = normalized_payment_attributes(row)

    assert(
      Payment.exists?(attributes),
      "Expected a payment with attributes #{attributes.inspect} to exist in the database"
    )
  end
end

Then('no payments should exist in the database') do
  assert_equal(0, Payment.count)
end

def normalized_payment_attributes(row)
  attributes = {}

  row.to_h.each do |key, value|
    normalized_key = key.downcase.gsub(/[^a-z]/, "")

    case normalized_key
    when "amount"
      attributes[:amount] = BigDecimal(value)
    when "duedate"
      attributes[:due_date] = Time.zone.parse(value)
    when "exchangedat", "exechangedat"
      attributes[:exchanged_at] = Time.zone.parse(value)
    end
  end

  attributes
end
