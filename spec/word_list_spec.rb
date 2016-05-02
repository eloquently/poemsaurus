require 'word_list'

describe WordList do 

	describe '#search' do
		it 'returns a hash of synonyms of the parameter it takes' do
			expect(WordList.search("hate")).to eq('{"response":[{"list":{"category":"(noun)","synonyms":"hatred|emotion|love (antonym)"}},{"list":{"category":"(verb)","synonyms":"detest|dislike|love (antonym)"}}]}')
		end
	end

	describe '#get_rhyme' do
		it 'returns a list of potential rhymes for a given word' do
			expect(WordList.get_rhyme("hate")).to eq(["fate", "fete", "sate", "state", "late", "rate", "date", "weight", "gate", "wait"])
		end
	end

		
	describe '#make_neat_arrays' do 
		it 'goes through a synonym hash and returns arrays sorted into parts of speech' do
			expect(WordList.make_neat_arrays('{"response":[{"list":{"category":"(noun)","synonyms":"hatred|emotion|love (antonym)"}},{"list":{"category":"(verb)","synonyms":"detest|dislike|love (antonym)"}}]}')).to eq([["hatred", "emotion"], [], ["detest", "dislike"], []])
		end
	end

	describe '#remove_results_with_spaces' do
		it 'goes through the arrays and removes results with spaces in them' do
			expect(WordList.remove_results_with_spaces(["hatred", "emotion", "love (antonym)"])).to eq(["hatred", "emotion"])
		end
	end

	describe '#format_as_list' do
		it 'accepts an array of arrays sorted by part of speech and returns a neatly formatted list' do
			expect(WordList.format_as_list([["hatred", "emotion"], [], ["detest", "dislike"], []])).to eq(["nouns", "-----", ["hatred", "emotion"], " ", "adjectives", "-----------", [], " ", "other words", "-----------", ["detest", "dislike"]])
		end
	end

end