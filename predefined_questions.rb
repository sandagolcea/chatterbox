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
