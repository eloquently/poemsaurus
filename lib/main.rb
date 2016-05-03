# Jess Mear
# Spring 2016

# PoemSaurus

# Purpose: Use an API to generate randomized semi-sensical poetry
#
# Related files: main.rb poem.rb, word_list.rb
# APIs used: http://thesaurus.altervista.org/ & RhymeBrain.com

# Future features might include:
# better pluralizer
# better rhymes
# more poem frameworks; either user choice or random
# expand list of default nouns, verbs, adjs (in word banks at the top of build_poem)
# expand seed word list (in handle_nil)

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
	break if user_choice == "q"
end