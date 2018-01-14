RSpec.describe TweetsController do
	it "checks if encrypting work" do
		post :create, params: {id: 1, tweet: "kurvi sbogom!!!"}
		msg = Tweet.find_by id: JSON.parse(response.body)["id"]
		expect(msg.content).to eq "77527,86992,45618,89549,60500,5100,29315,43171,45730,81907"
	end

	it "checks if encrypting work with funkier string" do
		post :create, params: {id: 1, tweet: "nqma kompanionki nqma barove"}
		msg = Tweet.find_by id: JSON.parse(response.body)["id"]
		expect(msg.content).to eq "84275,22898,32376,36607,29315,54582,510500,5100,81907,81907,40806,36991,18282,40806,20180,36991,36991,40806,26156,77688,26156,44213,36645,40806,18282,20180,36645"
	end

	it "checks decrypt" do
		post :decrypt, params: {id: 1, tweet: "77827,86992,45618,89549,60500,5100,29315,43171,45730,81907"}
		expect(JSON.parse(response.body)["content"]).to eq "hluzga se!"
	end
end
