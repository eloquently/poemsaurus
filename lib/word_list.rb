# Jessica Mear
# Spring 2016

require 'json'
require 'open-uri'



class WordList

	def self.search(seed)
		### SAMPLE DATA ###
		peace = '{"response":[{"list":{"category":"(noun)","synonyms":"order|war (antonym)"}},{"list":{"category":"(noun)","synonyms":"harmony|concord|concordance"}},{"list":{"category":"(noun)","synonyms":"peacefulness|peace of mind|repose|serenity|heartsease|ataraxis|tranquillity|tranquility|quietness|quietude"}},{"list":{"category":"(noun)","synonyms":"public security|security"}},{"list":{"category":"(noun)","synonyms":"peace treaty|pacification|treaty|pact|accord"}}]}'

		fire = '{"response":[{"list":{"category":"(noun)","synonyms":"happening|occurrence|occurrent|natural event"}},{"list":{"category":"(noun)","synonyms":"flame|flaming|combustion|burning"}},{"list":{"category":"(noun)","synonyms":"firing|attack|onslaught|onset|onrush"}},{"list":{"category":"(noun)","synonyms":"fireplace|hearth|open fireplace"}},{"list":{"category":"(noun)","synonyms":"attack|flak|flack|blast|criticism|unfavorable judgment"}},{"list":{"category":"(noun)","synonyms":"ardor|ardour|fervor|fervour|fervency|fervidness|passion|passionateness"}},{"list":{"category":"(noun)","synonyms":"element"}},{"list":{"category":"(noun)","synonyms":"trial|tribulation|visitation"}},{"list":{"category":"(verb)","synonyms":"open fire|shoot"}},{"list":{"category":"(verb)","synonyms":"discharge"}},{"list":{"category":"(verb)","synonyms":"bake"}},{"list":{"category":"(verb)","synonyms":"give notice|can|dismiss|give the axe|send away|sack|force out|give the sack|terminate|remove|hire (antonym)"}},{"list":{"category":"(verb)","synonyms":"discharge|go off"}},{"list":{"category":"(verb)","synonyms":"chase away|drive out|turn back|drive away|dispel|drive off|run off"}},{"list":{"category":"(verb)","synonyms":"arouse|elicit|enkindle|kindle|evoke|raise|provoke|make|create"}},{"list":{"category":"(verb)","synonyms":"burn|burn down|destroy|ruin"}},{"list":{"category":"(verb)","synonyms":"fuel|supply|provide|render|furnish"}}]}'

		love = '{"response":[{"list":{"category":"(noun)","synonyms":"emotion|hate (antonym)"}},{"list":{"category":"(noun)","synonyms":"passion|object"}},{"list":{"category":"(noun)","synonyms":"beloved|dear|dearest|loved one|honey|lover"}},{"list":{"category":"(noun)","synonyms":"sexual love|erotic love|sexual desire|eros|concupiscence|physical attraction"}},{"list":{"category":"(noun)","synonyms":"score"}},{"list":{"category":"(noun)","synonyms":"sexual love|lovemaking|making love|love life|sexual activity|sexual practice|sex|sex activity"}},{"list":{"category":"(verb)","synonyms":"hate (antonym)"}},{"list":{"category":"(verb)","synonyms":"enjoy|like"}},{"list":{"category":"(verb)","synonyms":"love"}},{"list":{"category":"(verb)","synonyms":"roll in the hay|make out|make love|sleep with|get laid|have sex|know|do it|be intimate|have intercourse|have it away|have it off|screw|fuck|jazz|eff|hump|lie with|bed|have a go at it|bang|get it on|bonk|copulate|mate|pair|couple"}}]}'

		hate = '{"response":[{"list":{"category":"(noun)","synonyms":"hatred|emotion|love (antonym)"}},{"list":{"category":"(verb)","synonyms":"detest|dislike|love (antonym)"}}]}'

		run ='{"response":[{"list":{"category":"(noun)","synonyms":"tally|score"}},{"list":{"category":"(noun)","synonyms":"test|trial|attempt|effort|endeavor|endeavour|try"}},{"list":{"category":"(noun)","synonyms":"footrace|foot race|race"}},{"list":{"category":"(noun)","synonyms":"streak|succession"}},{"list":{"category":"(noun)","synonyms":"running|running play|running game|football play"}},{"list":{"category":"(noun)","synonyms":"trip"}},{"list":{"category":"(noun)","synonyms":"running|locomotion|travel"}},{"list":{"category":"(noun)","synonyms":"time period|period of time|period"}},{"list":{"category":"(noun)","synonyms":"liberty"}},{"list":{"category":"(noun)","synonyms":"indefinite quantity"}},{"list":{"category":"(noun)","synonyms":"rivulet|rill|runnel|streamlet|stream|watercourse"}},{"list":{"category":"(noun)","synonyms":"political campaign|campaign|race"}},{"list":{"category":"(noun)","synonyms":"ladder|ravel|damage|harm|impairment"}},{"list":{"category":"(noun)","synonyms":"discharge|outpouring|flow|flowing"}},{"list":{"category":"(noun)","synonyms":"sequence|chronological sequence|succession|successiveness|chronological succession"}},{"list":{"category":"(noun)","synonyms":"trip"}},{"list":{"category":"(verb)","synonyms":"travel rapidly|speed|hurry|zip|run around (related term)|run away (related term)"}},{"list":{"category":"(verb)","synonyms":"scat|scarper|turn tail|lam|run away|hightail it|bunk|head for the hills|take to the woods|escape|fly the coop|break away|leave|go forth|go away"}},{"list":{"category":"(verb)","synonyms":"go|pass|lead|extend|be|extend to (related term)|run along (related term)"}},{"list":{"category":"(verb)","synonyms":"operate|direct"}},{"list":{"category":"(verb)","synonyms":"go|be"}},{"list":{"category":"(verb)","synonyms":"flow|feed|course|move|flow from (related term)|run over (related term)"}},{"list":{"category":"(verb)","synonyms":"function|work|operate|go|malfunction (antonym)"}},{"list":{"category":"(verb)","synonyms":"range|be"}},{"list":{"category":"(verb)","synonyms":"campaign|race|run"}},{"list":{"category":"(verb)","synonyms":"play"}},{"list":{"category":"(verb)","synonyms":"travel|go|move|locomote"}},{"list":{"category":"(verb)","synonyms":"tend|be given|lean|incline|be"}},{"list":{"category":"(verb)","synonyms":"execute|enforce|implement|apply"}},{"list":{"category":"(verb)","synonyms":"function|work|operate|go|run|idle (antonym)"}},{"list":{"category":"(verb)","synonyms":"become|go|get"}},{"list":{"category":"(verb)","synonyms":"process|treat"}},{"list":{"category":"(verb)","synonyms":"incur"}},{"list":{"category":"(verb)","synonyms":"prevail|persist|die hard|endure|continue"}},{"list":{"category":"(verb)","synonyms":"occur"}},{"list":{"category":"(verb)","synonyms":"carry|circulate|circularize|circularise|distribute|disseminate|propagate|broadcast|spread|diffuse|disperse|pass around"}},{"list":{"category":"(verb)","synonyms":"carry through|accomplish|execute|carry out|action|fulfill|fulfil"}},{"list":{"category":"(verb)","synonyms":"guide|draw|pass|pass over (related term)|pass around (related term)"}},{"list":{"category":"(verb)","synonyms":"lead|pass|make pass"}},{"list":{"category":"(verb)","synonyms":"succeed|win|come through|bring home the bacon|deliver the goods"}},{"list":{"category":"(verb)","synonyms":"black market|trade|merchandise"}},{"list":{"category":"(verb)","synonyms":"move|displace"}},{"list":{"category":"(verb)","synonyms":"bleed|diffuse|spread|spread out|fan out"}},{"list":{"category":"(verb)","synonyms":"sail"}},{"list":{"category":"(verb)","synonyms":"pass|go through|go across"}},{"list":{"category":"(verb)","synonyms":"run for|last|endure"}},{"list":{"category":"(verb)","synonyms":"free|liberate|release|unloose|unloosen|loose"}},{"list":{"category":"(verb)","synonyms":"consort|accompany"}},{"list":{"category":"(verb)","synonyms":"run"}},{"list":{"category":"(verb)","synonyms":"travel|go|move|locomote"}},{"list":{"category":"(verb)","synonyms":"ply|travel|trip|jaunt"}},{"list":{"category":"(verb)","synonyms":"hunt|hunt down|track down|capture|catch"}},{"list":{"category":"(verb)","synonyms":"race|compete|vie|contend|run off (related term)"}},{"list":{"category":"(verb)","synonyms":"move|go|change"}},{"list":{"category":"(verb)","synonyms":"melt|melt down|dissolve|resolve|break up"}},{"list":{"category":"(verb)","synonyms":"ladder|break|separate|split up|fall apart|come apart"}},{"list":{"category":"(verb)","synonyms":"unravel|disintegrate"}}]}'

		purple = '{"response":[{"list":{"category":"(adj)","synonyms":"violet|purplish|chromatic (similar term)"}},{"list":{"category":"(adj)","synonyms":"embellished|empurpled|over-embellished|rhetorical (similar term)"}},{"list":{"category":"(adj)","synonyms":"imperial|majestic|regal|royal|noble (similar term)"}},{"list":{"category":"(noun)","synonyms":"purpleness|chromatic color|chromatic colour|spectral color|spectral colour"}},{"list":{"category":"(noun)","synonyms":"nobility|noblesse"}},{"list":{"category":"(verb)","synonyms":"discolor|discolour|colour|color"}},{"list":{"category":"(verb)","synonyms":"empurple|purpurate|color|colorize|colorise|colourise|colourize|colour|color in|colour in"}}]}'

		poem = '{"response":[{"list":{"category":"(noun)","synonyms":"verse form|literary composition|literary work"}}]}'

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

		### FOR TESTING PURPOSES ###
		# To use without an API key, or to test without using up the API resources
		# COMMENT OUT lines 33 to 38 (url = to the end of the rescue)
		# UNCOMMENT line 46  and replace peace with any string variable from the sample data above
		# choices include: peace fire love hate run purple poem

		#words = peace 
		return words
	end

	def self.get_rhyme(word)
		url = "http://rhymebrain.com/talk?function=getRhymes&word=#{word}&maxResults=15"
		rhymes = open(url).read
		rhymes_array = JSON.parse(rhymes)
		rhymes = []
		rhymes_array.count.times do |i|
			rhymes << rhymes_array[i]["word"]
		end
		rhymes.shuffle!
		return rhymes
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
