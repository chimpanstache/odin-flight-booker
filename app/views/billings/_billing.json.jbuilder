json.extract! billing, :id, :last_4_digits, :cvc, :expiration_date, :created_at, :updated_at
json.url billing_url(billing, format: :json)
