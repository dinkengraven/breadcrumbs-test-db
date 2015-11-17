get "/users.json" do
  users = User.all
  content_type :json
  return {:users => [users]}.to_json
end

post "/users" do
  user = User.new(username: params[:username], email: params[:email])
  if user.save
    content_type :json
    return {message: "success!"}
  else
    content_type :json
    return {error: "user did not save"}
  end
end
