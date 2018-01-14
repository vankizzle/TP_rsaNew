require 'prime'
class RSA
	attr_accessor :n, :e, :d
   def initialize( n, e, d)
	@n = n
	@e = e
	@d = d
     #initializes this instance of RSA with a n,e and d variables of type int. 'n','e' are the public key and 'd' is the private one. This n,e,d should be used when encrypting and decrypting the message
   end
   
   def n
	 return @n
      #returns the value of 'n' passed in the initialize
   end
   
   def e
	return @e
      #returns the value of 'e' passed in the initialize
   end
   
   def d
	return @d
      #returns the value of 'd' passed in the initialize
   end
   
   def new_key
	while(1) do 
	p = rand(1..10)
	q = rand(1..10)
		if Prime.prime?(p) && Prime.prime?(q)
		break
		end
	end
	
	@n = p*q
	fiofn = (p-1)*(q-1)
	
	while(1) do
	@e = rand(1..5)
		if @e != Prime.prime_division(@n) && 1 < @e && @e < fiofn then
		break
		end
	end
	k = 2
	@d = 1 + (k*fiofn)/@e
	
	keys = Array[@n,@e,@d]
	return keys
      #generates a new 'n','e' and 'd' values following the RSA algorithm. Returns a new array of three elements where the first element is 'n', the second is 'e' and the third is 'd'. Each time it is called a new key must be returned.
   end
   
   def encrypt message
	return (message.chars.map {|c| c.ord ** @e % @n}).join(",")
      #encrypts the message passed. The message is of type string. Encrypts each symbol of this string by using its ASCII number representation and returns the encrypted message.
   end
   
   def decrypt message
	return (message.split(",").map {|c| (c.to_i ** @d % @n).chr}).join("")
      #decrypts the message passed. The message is of type string. Decrypts each symbol of this string Encrypts each symbol of this string by using its ASCII number representationand returns the decrypted message. 
   end 

#  test1 = RSA.new(1,2,3)
#	test1.new_key
#	test1.n
#	test1.e
#	test1.d
#	test1.encrypt("test")
#	test1.decrypt("a")
end
