# Use this song data for your tests
songs = [
  "The Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "The Phoenix - Consolation Prizes"
]

describe Song do
	describe "#initialize" do
		context "given a new Song with a name" do
		it "sets the value of @name to name" do
		song = Song.new("Tokyo Police Club - Wait Up")
		expect(song.name).to eql("Tokyo Police Club - Wait Up")
	  end
    end
  end
end

describe Jukebox do
	describe "#initialize" do
		context "given a new Jukebox with a set of songs" do
			
			it "assigns the songs to jukebox" do
				jukebox = Jukebox.new(songs) 
				expect(jukebox.songs).to eql(songs)
			end
			it "assigns true to @on" do 
				jukebox = Jukebox.new(songs)
				expect(jukebox.on?).to eql(true)
			end
		end
	 end

	describe "#on?" do
		context "jukebox is on" do
			it "assigns true to @on" do
				jukebox = Jukebox.new(songs)
				expect(jukebox.on?).to eql(true)
			end
		end
		context "jukebox is off" do 
			it "assigns false to @on" do
				jukebox = Jukebox.new(songs)
				jukebox.exit
				expect(jukebox.on?).to eql(false)
			end
		end
	end

	describe "#help" do
		context "User selects 'help" do
			it "returns 'Please select help, list, exit, or play.'" do
				jukebox = Jukebox.new(songs)
				expect(jukebox.help).to eql("Please select help, list, exit, or play.")
			end
		end
	end

	describe "#command" do
		context "given 'help'" do
			it " returns 'Please select help, list, exit, or play.'" do
				jukebox = Jukebox.new(songs)
				expect(jukebox.command("help")).to eql("Please select help, list, exit, or play.")
			end
		end

		context "given 'play'" do
			jukebox = Jukebox.new(songs)
			song_request = "The Naked and the Famous - Young Blood"
			it "returns 'now playing #{song_request}'" do
				expect(jukebox.command("play  #{song_request}")).to eql("now playing #{song_request}")
			end
		end

		context "given command other than 'help, list, exit, or play'" do
			it "returns 'invalid command'" do
				jukebox = Jukebox.new(songs)
				expect(jukebox.command("test")).to eql("invalid command")
			end
		end
	end

	describe "#exit" do
		jukebox = Jukebox.new(songs)
		jukebox.exit
		it "assigns false to @on" do 
			expect(jukebox.on?).to eql(false)
		end
		it "returns 'Goodbye, thanks for listening!'" do 
			expect(jukebox.exit).to eql("Goodbye, thanks for listening!")
		end
	end

	describe "#list" do
		jukebox = Jukebox.new(songs)
		jukebox.list 
		it "numbers and lists all songs in jukebox" do
			expect(jukebox.list.include?("3 Sufjan Stevens - Too Much\/n"))
		end
	end

	describe "#play" do
		jukebox = Jukebox.new(songs)
		song_request = "Tokyo Police Club - Wait Up"
		it "returns 'now playing #{song_request}'" do
			expect(jukebox.play(song_request)).to eql("now playing #{song_request}")
		end
	end

end
