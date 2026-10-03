json.extract! stripe_purchase, :id, :created_at, :updated_at
json.url stripe_purchase_url(stripe_purchase, format: :json)
