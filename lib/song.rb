class Song
  attr_accessor  :name, :genre
  attr_reader :artist

  @@all = []

  def initialize(name)
    @name = name
    @artist = nil
    save
  end

  def artist=(a)
    @artist = a
  end

  def save
    @@all << self
  end

  def self.all
    @@all
    #@@all.map do
    #|song|
    # song.artist
    #end
  end

  def self.song_count
    return @@all.size
  end

  def artist_name= (target)
    @artist = Artist.find_or_create_by_name(target)

  end

  def self.new_by_filename(filename)
    song = self.new(filename.split(" - ")[1])
    temp = artist_name(filename.split(" - ")[0])
    temp.add_song(song)

    song
  end

  def self.all_songs
    return @@all
  end

  def artist_name
    return @artist.name
  end

end