# Jess Mear
# Spring 2016

require_relative 'word_list'
require 'json'
require 'open-uri'


# Eric: Minor quibble -- it might be better to call this class something else
# I would expect a class called Poem to just contain data and logice about one
# poem, not all the data/logic for the entire application
class Poem

	def title_display
		puts " "
		puts "                                                                                          __"
		puts ".~'^'~._.~'^'~._.~'^'~._.~'^'~._.~'^'~._.~'^'~._.~'^'~._.~'^'~._.~'^'~._.~'^'~._.~'^'~. /`'_)"
		puts "  .___                            ___                                                  /  / "
		puts "  /   \\   __.    ___  , _ , _    (   '   ___  ,   . .___  ,   .  ___          _,-^^^-,/  /  "
		puts "  |,_,' .'   \\ .'   ; |' `|' `.   `-.   /   : |   | /   \\ |   | (   '       ,'          /   "
		puts "  |     |    | |----' |   |   |      | |    | |   | |   ' |   |  `--.   _,'' ,\( ,    \( ; "
		puts "  /      .__.' `.___, /   '   / \\___.' `.__/| `._/| /     `._/| \\__.'  /__.-' |_|----|_|  "
		puts "                                                                            "
		puts "'~._.~'`'~._.~'`'~._.~'`'~._.~'`'~._.~'`'~._.~'`'~._.~'`'~._.~'`'~._.~'`'~._.~'`'~._.~'"
	end

	def menu_display
		puts " "
		puts "      poem * ~ rhyme on ~ again ~ next ~ save * ~ slist * ~ rlist * ~ help ~ quit  "
		puts "                           (Replace the * with your word!)"
		puts " "
	end

	def help_display
		puts " "
		puts "Command          Result"
		puts "-------          ------"
		puts "poem <word>      Replace <word> with a word of your choice."
		puts "or               A randomized poem will be generated."
		puts "p <word>         Note: Random words may be added if there are not enough related results."
		puts " "
		puts "rhyme <command>  Replace <command> with true or on to turn rhyme on."
		puts "                 Any other word after rhyme turns it off."
		puts " "
		puts "again            A new poem will be genrated using the same seed word as before."
		puts " "
		puts "next             A new poem will be genrated using a synonym of the last seed word."
		puts " "
		puts "save <filename>  Replace <fielname> with a filename of your choice."
		puts "                 The last poem generated will be saved."
		puts " "
		puts "slist <word>     Replace <word> with a word of your choice."
		puts "                 A randomized list of synonyms will be generated."
		puts " "
		puts "rlist <word>     Replace <word> with a word of your choice."
		puts "                 A randomized list of rhymes will be generated."
		puts " "
		puts "quit or q        Quit out of the program."
		puts " "
		puts "credits          Roll the credits!"
		puts " "
	end

	def credits_display
		puts " "
		puts "                 Created by Jessica Mear"
		puts "                       Spring 2016"
		puts "           As a part of an Eloquent.ly Workshop"
		puts " "
		puts "             APIs used include RhymeBrain.com"
		puts "                & thesaurus.altervista.org"
		puts " "
	end

# Eric: One way to make your code more DRY: create a method called display_text
# and have that print "\n#{str}\n\n". That way, if you ever wanted to change the
# spacing, you would only have to change it in one place.
# More generally, this would also be a way to separate your display logic from
# the rest of the program. If you wanted an SMS-interface, you wouldn't want all
# the newlines.
	def error_display
		puts "\nSorry, that wont work. Try 'help' or 'menu' (without the quotes).\n\n"
	end

	def interface(user_choice)
		user_choice.downcase!
		choice_array = user_choice.split(" ")
		case choice_array[0]
		when "quit", "q"
			if choice_array[1] == nil
				self.credits_display
			else
				self.error_display
			end
		when "slist"
			self.list_synonyms(choice_array[1])
		when "rlist"
			self.list_rhymes(choice_array[1])
		when "poem", "p"
			self.build_poem(choice_array[1])
		when "again"
			self.randomize_again
		when "next"
			self.randomize_on_synonym
		when "save"
			self.save_poem(choice_array[1])
		when "rhyme"
			self.rhyme_flag(choice_array[1])
		when "menu"
			self.menu_display
		when "help"
			self.help_display
		when "credits"
			self.credits_display
		else
			error_display
		end

	end

	def list_synonyms(seed_word)
		@saved_seed = seed_word
		if @saved_seed.class == String
			words = WordList.search(@saved_seed)
			if words == nil
				self.handle_nil
				words = WordList.search(@saved_seed)
			end
			arrays = WordList.make_neat_arrays(words)
			puts ""
			puts "#{@saved_seed}"
			puts ""
			puts WordList.format_as_list(arrays)
			puts ""
		else
			puts "\nInvalid. Format required: slist <any-word>\n\n"
		end
	end

	def list_rhymes(seed_word)
		@saved_seed = seed_word
		if @saved_seed.class == String
			words = WordList.get_rhyme(@saved_seed)
			if words == nil
				self.handle_nil
				words = WordList.get_rhyme(@saved_seed)
			end
			puts ""
			puts "#{@saved_seed}"
			puts ""
			puts words
			puts ""
		else
			puts "\nInvalid. Format required: rlist <any-word>\n\n"
		end
	end

	def build_poem(seed_word=nil)
		@saved_seed = seed_word
		#### WORD BANKS ####

# Eric: the idiomatic ruby way to make an array of words is to use this syntax:
# backup_adjs = %w(cunning precocious angry)
# => ["cunning", "precocious", "angry"]
		backup_adjs = "cunning precocious angry furious bad awful terrible horrible big huge gigantic giant clean spotless cold freezing crowded packed dirty filthy funny hilarious good wonderful fantastic excellent hot boiling hungry starving interesting fascinating old ancient pretty gorgeous scary terrifying small tiny surprising astounding tired exhausted ugly hideous red orange yellow green blue indigo violet purple pink shiny brave one eleven twelve forty-two cool awesome lovely dark silent fearful brave young old tangled".split(" ").shuffle

		backup_nouns = "hat barber fear iris daisy paste play prelude women ewok baboon belief light lightsaber princess ringworm jedi attention bowtie fez converse sneakers buffet eyelash garbage paint sun star sparkle ewok knight ghost jedi padawan wookie firefly serenity shiny sky reaver vader mario peach nintendo zelda sword link past time pipe jump spin flip spirit wisdom courage forest green river song doctor nine eleven empty child dance tardis travel time-travel planet star sun sparkle disaster pony rainbow cloud penguin shining number rock doll lego computer keyboard ruby poem lyric verse".split(" ").shuffle

		backup_verbs = "misbehave add allow bake bang call chase damage drop end escape fasten fix gather grab hang hug imagine itch jog jump kick knit land lock march mix name notice obey open pass promise question reach rinse scatter stay talk turn untie use vanish visit walk work yawn yell zip zoom fly sweep climb run sprint cackle obey sing blink smile laugh giggle".split(" ").shuffle

		helping_verbs = "shall will does did may must might can could would should".split(" ").shuffle

		possessive_adjectives = "my your his her its our their whose".split(" ").shuffle

		prepositions = "aboard about above across after against along amid among around as at before behind below beneath beside besides between beyond but by concerning considering despite down during except excepting excluding following for from in inside into like minus near of off on onto opposite outside over past per plus regarding round save since than through to toward towards under underneath unlike until up upon versus via with within without".split(" ").shuffle

		pronouns = "she her he him it they them I we you".split(" ").shuffle

		indefinite_pronouns = "both few many several all any most none some".split(" ").shuffle

		interjections = "ah oh wow darn yikes damn ow".split(" ").shuffle

		linking_verbs_plural = "are seem look smell sound taste turn stay get feel grow prove".split(" ").shuffle

		linking_verbs_singular = "is seems looks smells sounds tastes turns stays gets feels grows proves".split(" ").shuffle

		conjunctions = "and but yet though".split(" ").shuffle

		determiners = "the that some enough each every".split(" ").shuffle



		if @saved_seed != "jess"
			self.handle_nil if @saved_seed == nil

			words = WordList.search(@saved_seed)
			if words == nil
				self.handle_nil
				words = WordList.search(@saved_seed)
			end
			arrays = WordList.make_neat_arrays(words)
			@list = arrays.join(" ").split(" ").shuffle
			arrays[0].unshift(@saved_seed)
			nouns = arrays[0].shuffle
			adjs = arrays[1].shuffle
			verbs = arrays[2].shuffle

			counter = 0
			# nouns.concat(backup_nouns)
			while nouns.count <= 6
				nouns << backup_nouns[counter]
				counter += 1
			end
			counter = 0
			while adjs.count <= 4
				adjs << backup_adjs[counter]
				counter += 1
			end
			counter = 0
			while verbs.count <= 3
				verbs << backup_verbs[counter]
				counter += 1
			end
		else
			nouns = backup_nouns
			adjs = backup_adjs
			verbs = backup_verbs
		end

		fwchoice = ["rrr", "candle"].shuffle


		if fwchoice[0] == "rrr"
			if @rhyming == "true"
				rhyme_array = WordList.get_rhyme(adjs[1])
				last_word1 = rhyme_array[0]
			else
				last_word1 = nouns[3]+"s"
			end
# Eric: This should be with all the other word arrays above
			transition_array = ["therefore", "so are", "everyone", "even if"]
			transition_array.shuffle!

			@poem = [ "\n", @saved_seed, "\n", "\n",
				nouns[0]+"s", linking_verbs_plural[0], adjs[0], "\n",
				nouns[1]+"s", linking_verbs_plural[0], adjs[1], "\n",
				nouns[2], linking_verbs_singular[0], adjs[3], "\n",
				conjunctions[0], transition_array[0], last_word1,
				"\n", "\n"].join(" ").downcase
		elsif fwchoice[0] == "candle"
			if @rhyming == "true"
				rhyme_array = WordList.get_rhyme(nouns[2])
				last_word2 = rhyme_array[0]+"!"
			else
				last_word2 = nouns[5]+"!"
			end
			#My candle burns at both ends;
   			#It will not last the night;
			#But ah, my foes, and oh, my friends—
   			#It gives a lovely light!

			@poem = [ "\n", @saved_seed+" (first fig pattern)", "\n", "\n",
				possessive_adjectives[0].capitalize, nouns[0], verbs[0]+"s", prepositions[0], indefinite_pronouns[0], nouns[1]+"s;", "\n",
	   			pronouns[1].capitalize, helping_verbs[0], "not", verbs[1], "the" ,nouns[2]+";", "\n",
				conjunctions[0].capitalize, interjections[0]+",", possessive_adjectives[0], nouns[3]+"s,", conjunctions[0], interjections[1]+",", possessive_adjectives[0], nouns[4]+"s-""\n",
	   			pronouns[1].capitalize, verbs[2]+"s", determiners[0], adjs[0], last_word2,
	   			"\n", "\n"
	   			].join(" ")
		end

		puts @poem

	end

	def randomize_again
		build_poem(@saved_seed)
	end

	def randomize_on_synonym
		if @list.class != Array
			self.handle_nil
		end
		@list.shuffle
		new_seed = @list[0]
		build_poem(new_seed)
	end

	def save_poem(file_name)
		file_name = @saved_seed if file_name == nil
		if file_name.class == String
	        File.write(file_name, @poem)
	        puts "\nSaved #{file_name}!\n\n"
		else
			puts "\nInvalid. Format required: save <filename>\n\n"
		end
	end

	def rhyme_flag(choice)
		@rhyming = choice
		if @rhyming == "true" or @rhyming == "on"
			@rhyming = "true"
			puts "\nRhyme is on!\n\n"
		else
			@rhyming = "false"
			puts "\nRhyme is off!\n\n"
		end
	end

	def handle_nil
		seeds = "scallywag rapscallion rogue knight ghost firefly serenity shiny sky peach sword link past time pipe jump spin flip spirit wisdom courage forest green river song doctor nine who empty child dance travel planet star sun sparkle disaster pony rainbow cloud penguin shining number rock doll computer keyboard ruby bravery".split(" ").shuffle
		@list = seeds
		@saved_seed = seeds[0]
	end

end

# Eric: I think that this code would be improved by creating a Poem class that
# holds data/logic for individual poems, and renaming this class to
# PoemGenerator. The @saved_seed instance variable is a bit weird in this class,
# and it would be nice to store already generated poems with their seed words.
# It would also separate the "model" logic from the "controller" logic.
# Rails will force you to separate your logic in this way.

# Another thing about class/method design that I didn't talk about:
# Generally you want your methods to either return data or manipulate data, not
# both. As another rule of thumb, methods should be doing only one thing and
# thus be fairly short. Your #build_poem method is very long and could definitely
# be broken up more.

# If I were writing this program, I would probably make the WordLists have an
# instance variable array that tracks the list of words, and use WordList
# objects instead of arrays to track them. This would let you do things like
# create a WordList instance method #pick_one, so you wouldn't have to do
# arr.shuffle ... arr[0] all the time in your program.