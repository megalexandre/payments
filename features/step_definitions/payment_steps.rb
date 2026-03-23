require "bigdecimal"

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

When('I fill in {string} with {string}') do |field, value|
  fill_in field, with: value
end

When('I click {string}') do |button|
  click_button button
end

Then('I should see {string}') do |text|
  assert_text(text)
end

Then('I should see {string} in the payments list') do |text|
  visit payments_path

  within('table.payments-table') do
    assert_text(text)
  end
end

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
