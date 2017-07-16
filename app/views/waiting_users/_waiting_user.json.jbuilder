json.extract! waiting_user, :id, :first_name, :last_name, :email, :phone, :fellowship, :city, :category_id, :created_at, :updated_at
json.url waiting_user_url(waiting_user, format: :json)
