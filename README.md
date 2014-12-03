Chatterbox Challenge
====================

What is it?
------
This is a regular chat bot with a very limited vocabulary

What does it do?
------

It chats with you on a limited range of items.
The chatbot is in the 'chatbot.rb' file, run it from the command line and then experiment chatting with it.

You can also add your own responses to your chosen keywords (see *how to run*)

How to run
------

    git clone git@github.com:sandagolcea/chatterbox.git
    cd chatterbox
    ruby chatbot.rb

To add more responses, write this phrase in the chatbot discussion, 
replacing the keywords and the response with your own input :
   `When someone says '<keywords>' you say '<response>'`


Possible Improvements
------
 - Adding the keywords/response pairs permanently (Added for session duration only)
 - Better question/answer implementation (Rogerian Psychoteraphy, see [Weizenbaum's paper on on ELIZA](http://en.wikipedia.org/wiki/ELIZA))
 - Modularization, probably could reimplement from 0, maybe OO, see [Eliza bot js implementation](http://www.masswerk.at/elizabot/) 

Original ruby input:
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
* [Eliza bot js implementation](http://www.masswerk.at/elizabot/)
