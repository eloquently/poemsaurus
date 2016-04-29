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
		end
		it 'calls list_synonyms' do
			expect(p).to receive(:list_synonyms).and_return(nil)
            p.interface('list')
		end
		it 'calls build_poem' do
			expect(p).to receive(:build_poem).and_return(nil)
            p.interface('poem')
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
		it 'calls menu' do
			expect(p).to receive(:menu_display).and_return(nil)
            p.interface('menu')
		end		
		it 'calls help' do
			expect(p).to receive(:help_display).and_return(nil)
            p.interface('help')
		end
		it 'calls credits' do
			expect(p).to receive(:credits_display).and_return(nil)
            p.interface('credits')
		end
	end

	describe '#list_synonyms' do
		it 'lists synonyms of the parameter it takes' do
			#expect
		end
	end


end