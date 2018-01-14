require 'rails_helper'
RSpec.describe RSA do

 	 it "should return the correct N" do
        rsa = RSA.new(123,0,0)
        expect(rsa.n).to eq 123
	end

	 it "should return the correct E" do
        rsa = RSA.new(0,123,0)
        expect(rsa.e).to eq 123
	end

	 it "should return the correct D" do
        rsa = RSA.new(0,0,123)
        expect(rsa.d).to eq 123
	end

	 it "should encrypt this short test" do
        rsa = RSA.new(91,5,29)
        expect(rsa.encrypt("A")).to eq "39"
	end

	it "should decrypt this short test" do
        rsa = RSA.new(91,5,29)
        expect(rsa.decrypt(rsa.encrypt("A"))).to eq("A")
	end

#	 it "should not change the message after encrypt->decrypt with keys 91,5,29" do
#        rsa = RSA.new(91,5,29)
#        expect(rsa.decrypt(rsa.encrypt("test"))).to eq "test"
#	end

	it "message after encryption should be different" do 
	 rsa = RSA.new(*RSA.new(1,2,3).new_key)
	 expect(rsa.encrypt("test")).not_to eq "test" 
	end 

end

