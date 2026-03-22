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
  expect(page).to have_content(text)
end

Then('I should see {int} payments') do |count|
  expect(page).to have_css('tr', count: count + 1) # +1 for header row
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
  expect(page).to have_content(text)
end

Given('a payment with amount {string} exists') do |amount|
  @payment = Payment.create!(amount: amount)
end

When('I visit the payment details page') do
  visit payment_path(@payment)
end

Then('I should see the payment details') do
  expect(page).to have_content(@payment.amount)
end

When('I visit the edit payment page') do
  visit edit_payment_path(@payment)
end

Then('the payment should be deleted') do
  expect(Payment.find_by(id: @payment.id)).to be_nil
end
