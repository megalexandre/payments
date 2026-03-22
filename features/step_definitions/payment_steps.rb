Given('the following payments exist:') do |table|
  table.hashes.each do |hash|
    Payment.create!(
      id: hash['id'],
      amount: hash['amount'],
      status: hash['status']
    )
  end
end

Given('I am on the payments index page') do
  visit payments_path
end

Then('I should see {string} in the payments list') do |text|
  next if page.has_content?(text)

  normalized_text = begin
    amount = BigDecimal(text)
    ActionController::Base.helpers.number_to_currency(amount, unit: "R$ ", separator: ",", delimiter: ".")
  rescue ArgumentError
    nil
  end

  next if normalized_text && page.has_content?(normalized_text)

  raise %(Expected payments list to include #{text.inspect})
end

Then('I should see {int} payments') do |count|
  next if page.has_css?('tr', count: count + 1)

  raise %(Expected to find #{count} payments in the table)
end

Given('I am on the new payment page') do
  visit new_payment_path
end

When('I fill in {string} with {string}') do |field, value|
  fill_in field, with: value
end

When('I click {string}') do |button|
  click_button button
end

Then('I should see {string}') do |text|
  next if page.has_content?(text)

  raise %(Expected page to include #{text.inspect})
end

Given('a payment with amount {string} exists') do |amount|
  @payment = Payment.create!(amount: amount)
end

When('I visit the payment details page') do
  visit payment_path(@payment)
end

Then('I should see the payment details') do
  next if page.has_content?(@payment.amount.to_s)

  raise %(Expected page to include payment amount #{@payment.amount})
end

When('I visit the edit payment page') do
  visit edit_payment_path(@payment)
end

Then('the payment should be deleted') do
  raise "Expected payment to be deleted" if Payment.exists?(id: @payment.id)
end
