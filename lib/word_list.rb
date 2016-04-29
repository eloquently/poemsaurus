# Jessica Mear
# Spring 2016

require 'json'
require 'open-uri'



class WordList

	def self.search(seed)
		### SAMPLE DATA ###
		purple = '{"response":[{"list":{"category":"(adj)","synonyms":"violet|purplish|chromatic (similar term)"}},{"list":{"category":"(adj)","synonyms":"embellished|empurpled|over-embellished|rhetorical (similar term)"}},{"list":{"category":"(adj)","synonyms":"imperial|majestic|regal|royal|noble (similar term)"}},{"list":{"category":"(noun)","synonyms":"purpleness|chromatic color|chromatic colour|spectral color|spectral colour"}},{"list":{"category":"(noun)","synonyms":"nobility|noblesse"}},{"list":{"category":"(verb)","synonyms":"discolor|discolour|colour|color"}},{"list":{"category":"(verb)","synonyms":"empurple|purpurate|color|colorize|colorise|colourise|colourize|colour|color in|colour in"}}]}'

		peace = '{"response":[{"list":{"category":"(noun)","synonyms":"order|war (antonym)"}},{"list":{"category":"(noun)","synonyms":"harmony|concord|concordance"}},{"list":{"category":"(noun)","synonyms":"peacefulness|peace of mind|repose|serenity|heartsease|ataraxis|tranquillity|tranquility|quietness|quietude"}},{"list":{"category":"(noun)","synonyms":"public security|security"}},{"list":{"category":"(noun)","synonyms":"peace treaty|pacification|treaty|pact|accord"}}]}'

		### METHOD ###

		apikey_str = File.read('secrets.json')
		apikey_hash = JSON.parse(apikey_str)
		apikey = apikey_hash["thesaurus_api_key"]

		url = "http://thesaurus.altervista.org/service.php?word=#{seed}&language=en_US&output=json&key=#{apikey}"
		begin
		   words = open(url).read
		rescue
		   puts "The request for #{seed} timed out so another word was selected for you."
		end

		### FOR TESTING URL ="" AND WORDS = open(url).read ARE COMMENTED AND REPLACED WITH THE FOLLOWING ###
		#words = peace 
		return words
	end

	def self.get_rhyme(word)
		url = "http://rhymebrain.com/talk?function=getRhymes&word=#{word}&maxResults=5"
		rhymes = open(url).read
		rhymes_array = JSON.parse(rhymes)
		rhymes = []
		rhymes_array.count.times do |i|
			rhymes << rhymes_array[i]["word"]
		end
		rhymes.shuffle!
		return rhymes[0]
	end

	def self.make_neat_arrays(words)
		entries_json = JSON.parse(words)
		nouns_array = []
		adj_array = []
		verb_array = []
		other_array = []
		entries_json["response"].count.times do |i|
			case entries_json["response"][i]["list"]["category"]
			when "(noun)"
				nouns_array << entries_json["response"][i]["list"]["synonyms"]
			when "(adj)"
				adj_array << entries_json["response"][i]["list"]["synonyms"]
			when "(verb)"
				verb_array << entries_json["response"][i]["list"]["synonyms"]
			else
				other_array << entries_json["response"][i]["list"]["synonyms"]
			end
		end
		nouns = nouns_array.join("|").split"|"
		adjs = adj_array.join("|").split"|"
		verbs = verb_array.join("|").split"|"
		other = other_array.join("|").split"|"

		temp = []
		nouns.count.times do |i|
			if nouns[i].count(" ") == 0
				temp << nouns[i]
			end
		end
		nouns = temp

		temp = []
		adjs.count.times do |i|
			if adjs[i].count(" ") == 0
				temp << adjs[i]
			end
		end
		adjs = temp

		temp = []
		verbs.count.times do |i|
			if verbs[i].count(" ") == 0
				temp << verbs[i]
			end
		end
		verbs = temp

		temp = []
		other.count.times do |i|
			if other[i].count(" ") == 0
				temp << other[i]
			end
		end
		other = temp


		arrays = [nouns, adjs, verbs, other]

		return arrays

	end

	def self.format_as_list(arrays)
		nouns = arrays[0]
		adjs = arrays[1]
		other = arrays[2]
		list = ["nouns", "-----", nouns, " ", "adjectives", "-----------", adjs, " ", "other words", "-----------", other]
	end

end
