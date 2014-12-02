Chatterbox Challenge
====================


What does it do?
------

The chatbot is in the 'chatbot.rb' file, run it from the command line and then experiment chatting with it.

Given ruby text was:
------

```ruby
def get_response(input)
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  /#{key}/ =~ input
  response = RESPONSES[key]
  response.nil? ? 'sorry?' : response % { c1: $1, c2: $2}
end

RESPONSES = { 'goodbye' => 'bye', 
              'sayonara' => 'sayonara', 
              'the weather is (.*)' => 'I hate it when it\'s %{c1}', 
              'I love (.*)' => 'I love %{c1} too', 
              'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}'}

puts "Hello, what's your name?"
name = gets.chomp
puts "Hello #{name}"
while(input = gets.chomp) do
  puts get_response(input)
end
```

Resources:

* [Ruby Regular Expressions Tutorial](http://rubylearning.com/satishtalim/ruby_regular_expressions.html)
* [Ruby Regex Cheat Sheet](http://www.ralfebert.de/archive/ruby/regex_cheat_sheet/)
* [Eliza Chat Bot](http://en.wikipedia.org/wiki/ELIZA)
* [Eliza Chat Bot implementation paper](http://www.cse.buffalo.edu/~rapaport/572/S02/weizenbaum.eliza.1966.pdf)
