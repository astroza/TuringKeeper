json.array!(@turing_users) do |turing_user|
  json.extract! turing_user, :id, :identifier, :FirstName, :LastName, :password
  json.url turing_user_url(turing_user, format: :json)
end
