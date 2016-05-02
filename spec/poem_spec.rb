require 'json'
require 'open-uri'
require 'poem'

describe Poem do 
	let(:poem) do Poem.new() 
    end

    let(:p) { Poem.new() }

    # NO TEST FOR:
    # title_display
    # menu_display
    # help_display
    # credits_display
    # error_display
    # they all just put information to the screen

	describe '#interface' do
		it 'calls quit' do
			expect(p).to receive(:credits_display).and_return(nil)
			p.interface('quit')
			expect(p).to receive(:credits_display).and_return(nil)
			p.interface('q')
		end
		it 'calls list_synonyms' do
			expect(p).to receive(:list_synonyms).and_return(nil)
            p.interface('slist')
		end
		it 'calls list_rhymes' do
			expect(p).to receive(:list_rhymes).and_return(nil)
            p.interface('rlist')
		end
		it 'calls build_poem' do
			expect(p).to receive(:build_poem).and_return(nil)
            p.interface('poem')
            expect(p).to receive(:build_poem).and_return(nil)
            p.interface('p')
		end
		it 'calls randomize_again' do
			expect(p).to receive(:randomize_again).and_return(nil)
            p.interface('again')
		end
		it 'calls randomize_on_synonym' do
			expect(p).to receive(:randomize_on_synonym).and_return(nil)
            p.interface('next')
		end
		it 'calls save_poem' do
			expect(p).to receive(:save_poem).and_return(nil)
            p.interface('save')
		end

		it 'calls rhyme_flag' do
			expect(p).to receive(:rhyme_flag).and_return(nil)
            p.interface('rhyme')
		end
	
		it 'calls menu_display' do
			expect(p).to receive(:menu_display).and_return(nil)
            p.interface('menu')
		end		
		it 'calls help_display' do
			expect(p).to receive(:help_display).and_return(nil)
            p.interface('help')
		end

		it 'calls credits_display' do
			expect(p).to receive(:credits_display).and_return(nil)
            p.interface('credits')
		end
		it 'calls error_display' do
			expect(p).to receive(:error_display).and_return(nil)
			p.interface('asdf')
		end
	end

	describe '#list_synonyms' do
		it 'lists synonyms of the parameter it takes' do

            expected_output = "\n"
            expected_output += "hate\n"
            expected_output += "\n"
            expected_output += "nouns\n"
            expected_output += "-----\n"
            expected_output += "hatred\n"
            expected_output += "emotion\n \n"
            expected_output += "adjectives\n"
            expected_output += "-----------\n \n"
            expected_output += "other words\n"
            expected_output += "-----------\n"
            expected_output += "detest\n"
            expected_output += "dislike\n\n"

            expect { p.list_synonyms("hate") }.to output(expected_output).to_stdout

        end
    end

    describe '#list_rhymes' do
		it 'lists rhymes of the parameter it takes' do

            expected_output = "\n"
            expected_output += "hate\n"
            expected_output += "\n"
            expected_output += "fate\n"
            expected_output += "fete\n"
            expected_output += "sate\n"
            expected_output += "state\n"
            expected_output += "late\n"
            expected_output += "rate\n"
            expected_output += "date\n"
            expected_output += "weight\n"
            expected_output += "gate\n"
            expected_output += "wait\n\n"

            expect { p.list_rhymes("hate") }.to output(expected_output).to_stdout

        end
    end

    describe '#build_poem' do
    	it 'accepts a seed word and builds a poem from that' do

    	end
    end

    describe '#randomize_again' do
    	it 'calls build_poem again' do
			expect(p).to receive(:build_poem).and_return(nil)
			p.randomize_again
        end
    end

    describe '#randomize_on_synonym' do 
    	it 'calls build_poem again' do
			expect(p).to receive(:build_poem).and_return(nil)
			p.randomize_on_synonym
        end
    end

    describe '#save_poem' do
    	it 'saves the most recent poem to a file' do
            expect(File).to receive(:write).with("filename", @poem).and_return nil
            p.save_poem('filename')
        end
    end

    describe '#rhyme_flag' do
    	it 'sets rhyming to on and prints appropriate message to user' do
			expect { p.rhyme_flag("on") }.to output("\nRhyme is on!\n\n").to_stdout
			#p.rhyme_flag("on")
			#expect(p.@rhyming).to eq("true")
		end
		it 'sets rhyming to off and prints appropriate message to user' do
			expect { p.rhyme_flag("off") }.to output("\nRhyme is off!\n\n").to_stdout
			#p.rhyme_flag("off")
			#expect(p.@rhyming).to eq("false")
		end
    end

    describe '#handle_nil' do
    	it 'returns a string' do 
    		expect(p.handle_nil.class).to eq(String)
    	end
    end

end