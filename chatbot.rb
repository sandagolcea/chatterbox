
require 'colorize'
require './responses.rb'
require './predefined_questions.rb'

def get_response(input)

  key = RESPONSES.keys.select {|k| /#{k}/ =~ input.downcase } #.sample
  temp_key = key.sample
  
  /#{temp_key}/ =~ input
  response = RESPONSES[temp_key].is_a?(Array) ? RESPONSES[temp_key].sample : RESPONSES[temp_key]
  response.nil? ? 'sorry?'.light_yellow : response % { c1: $1, c2: $2, c3: $3}

end

def write_user input
	@file.puts "USER: #{input}".light_green
end

def write_bot response
	@file.puts "BOT:  #{response}".light_red
end

f = File.new("newfile",  "w") 

File.open "newfile", "w" do |file|
	@file = file
	
	predefined_questions

  @regex = /[w|W]hen someone says '(.*)' you say '(.*)'/

	while( (input=gets.chomp) != 'quit') do
      if input =~ @regex
        RESPONSES[$1] = "#{$2}"
        puts "BOT: Response '#{$2}' added! ^_^ ..Anything else?".light_red
      else		
  		  response = get_response(input)
  		  puts response.light_red
  		  write_user input
  		  write_bot response
      end
	end
# p RESPONSES
# @user_responses.each { |x,y| RESPONSES[x] = y }
end
