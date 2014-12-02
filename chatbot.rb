require 'colorize'

def get_response(input)

  key = RESPONSES.keys.select {|k| /#{k}/ =~ input } #.sample
  temp_key = key.sample
  
  /#{temp_key}/ =~ input
  response = RESPONSES[temp_key].is_a?(Array) ? RESPONSES[temp_key].sample : RESPONSES[temp_key]
  response.nil? ? 'sorry?'.light_yellow : response % { c1: $1, c2: $2, c3: $3}

end

RESPONSES = {  'goodbye(.*)' => ['see you later', 'come back later!', 'bye'],
			  'bye' => ['see ya!','bbye!','tty later ;)'],
			  # '[^Hi$|^hi$]' => ['yes?','hello again','hi back to you'],
              'sayonara' => 'sayonara', 
              'the weather is (.*)' => 'I hate it when it\'s %{c1}', 
              'I like (.*)' => 'I love %{c1} too', 
              'I like (.*) test' => 'I love %{c1} test too', 
              'I like (.*)' => 'I dont!', 
              'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}',
              'how are you?' => 'I\'m feeling good, how are you feeling today?',
              'good' => 'Great!',
              # 'feel(.*)[tired|sad|angry|sleepy]' => 'Sorry to hear that',
              # 'feel(.*)[good|happy|alive]+' => 'Oh, that is nice to hear :)',
              'any plans' => 'Just to be awesome!!',
              '([wanna|want to]) go(.*)?' => 'Yes!!',
              '([wanna|want to]) go(.*)somewhere?' => 'Depends..what did you have in mind?',
              '([wanna|want to]) go out?' => 'Maybe.',
              'when' => 'Tomorrow works for me.',
              'when(.*)?' => 'How about next week?',
              'ok' => ['Cool!','Sure'],
              'ok,(.*)?' => ['Donno','Care to try again?'],
              'no' => 'I understand.',
              'yes' => 'ok.',
              'no(.*)do(.*)' => ['Yes I do!','I am pretty sure I do'],
              'How do you like your (.*) ?' => 'I like my %{c1} spicy!!',
              'Do you want to (.*), (.*) or (.*) ?' => 'Do you like %{c3}?'
          }


def write_user input
	@file.puts "USER: #{input}".light_green
end

def write_bot response
	@file.puts "BOT:  #{response}".light_red
end

def predefined_questions
	# bot
	puts "Hello, what's your name?".light_red 
	@file.puts "BOT:  Hello, what's your name?".light_red
	# user
	name = gets.chomp
	write_user name
	# bot
	puts "Hello #{name}".light_red
	@file.puts "BOT:  Hello #{name}".light_red
end

f = File.new("newfile",  "w") 

File.open "newfile", "w" do |file|
	@file = file
	
	predefined_questions

	while( (input=gets.chomp) != 'quit') do
  		
  		response = get_response(input)
  		puts response.light_red
  		write_user input
  		write_bot response
	end

end