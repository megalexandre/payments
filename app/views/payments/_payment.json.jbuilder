json.extract! payment, :id, :amount, :exchanged_at, :due_date, :created_at, :updated_at
json.url payment_url(payment, format: :json)
