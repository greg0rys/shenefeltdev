json.extract! stripe_customer, :id, :created_at, :updated_at
json.url stripe_customer_url(stripe_customer, format: :json)
