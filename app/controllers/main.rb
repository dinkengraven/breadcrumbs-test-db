get "/users.json" do
  users = User.all
  content_type :json
  return {:users => [users]}.to_json
end

post "/users" do
  user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
  if user.save
    content_type :json
    return {message: "success!"}.to_json
  else
    content_type :json
    return {error: "user did not save"}.to_json
  end
end
