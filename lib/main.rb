# Jessica Mear
# Spring 2016
#
# Purpose: Use an API to generate randomized semi-sensical poetry
#
# Related files: main.rb poem.rb, word_list.rb
# APIs used: http://thesaurus.altervista.org/


require_relative 'poem'

p = Poem.new()

p.title_display
p.menu_display
puts " "

while true
	print "Enter a command: "
	user_choice = gets.chomp
	p.interface(user_choice)
	break if user_choice == "quit"
end

# write tests
# write rhyme for candle
# rhyme list
# test git
# refactor code
# better pluralizer
# later: rrr "seed", willie "seed", lime "seed", etc option to switch poem framework