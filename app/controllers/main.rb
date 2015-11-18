get "/users.json" do
  users = User.all
  content_type :json
  return {:users => [users]}.to_json
end

post "/users" do
  user = User.new(params[:user])
  if user.save
    content_type :json
    return {message: "success!"}.to_json
  else
    content_type :json
    return {error: "user did not save"}.to_json
  end
end

post "/login" do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    content_type :json
    return {message: "login successful"}.to_json
  else
    content_type :json
    return {error: "everything is terrible"}.to_json
  end
end

post "/breadcrumbs" do
  breadcrumb = Breadcrumb.new(params[:breadcrumb])
  if breadcrumb.save
    content_type :json
    return {message: "successful breadCrumb creation"}.to_json
  else
    errors = breadcrumb.errors.full_messages
    content_type :json
    return {errors: errors}.to_json
end

get "/breadcrumbs/:id" do
  breadcrumb = Breadcrumb.find(params[:id])
  content_type :json
  return {:breadcrumb => breadcrumb}.to_json
end
