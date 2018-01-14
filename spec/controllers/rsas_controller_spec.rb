require 'spec_helper'
require 'rails_helper'
require 'rubygems'
require 'json'
RSpec.describe RsasController do
describe 'POST' do

	subject do
	      post :create, format: :json
	end

	it "creates a new rsa" do
		post :create, params: {n: 5, e:7, d: 3}
		expect(Rsa.count).to eq 1
	end

	it 'should return id' do
	      subject
	      expect(JSON.parse(response.body)['id'].to_i).to be_integer
	end

end

describe 'GET' do
  
	subject do
	    get :show, params: { id: '1' }, format: :json
	end

end

end
