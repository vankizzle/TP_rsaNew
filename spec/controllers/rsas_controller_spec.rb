RSpec.describe RsasController do

it „gets by id“ do
get :show, id: 1
expect(response.body).to eq
„the content“
end

it „creates a new rsa“ do
post :create, params: {n: 5, e:7, d: 3}

expect(Rsa.count).to eq 1
end

end
