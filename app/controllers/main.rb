get "/users.json" do
  users = User.all
  content_type :json
  return {:users => [users]}.to_json
end
