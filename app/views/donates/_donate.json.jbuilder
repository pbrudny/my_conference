json.extract! donate, :id, :amount, :email, :first_name, :last_name, :received, :created_at, :updated_at
json.url donate_url(donate, format: :json)
