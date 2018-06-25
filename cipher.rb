#Caesar cipher takes input string and displaces all characters by a set value, if value reaches 'z' it will loop around back to 'a'

require 'sinatra'
require 'sinatra/reloader'

get '/' do
	displacement = 4;
	cipher = '';
	word = params["word"].downcase().to_s.split('') #Take input and split into lowercase array
	word.each do |character|
		cipher << cipher(character, displacement) #For each character, increase by ascii value by displacement for cipher
	end
	erb :index, :locals => {
		:cipher => cipher
	}
end

def cipher (letter, displacement)
	new_val = 0;
	if letter.ord == 32
		new_val = 32
	elsif new_val > 122 #Convert letter if letter exceeds value for 'z'
		new_val = (letter.ord+displacement)%123+97
	else
		new_val = (letter.ord+displacement)
	end
	return new_val.chr #Convert new ascii value to char
end