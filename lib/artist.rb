require_relative "song.rb"
require 'pry'

class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name

    save
  end

  def save

    @@all << self
  end

  def add_song(song)
    song.artist = self
  end

  def songs
    Song.all_songs.select do
    |song|

      song.artist == self
    end
  end

  def add_song_by_name(name)
    song = Song.new(name)
    song.artist = self
  end

  def self.find_or_create_by_name(name)
    @@all.each do
    |artist|
      #binding.pry
      if(artist.name == name)
        # binding.pry
        return artist
      end
    end
    #binding.pry
    return Artist.new(name)
  end

  def self.song_count
    return Song.song_count
  end

  def print_songs
    Song.all_songs.select do
    |song|
      if(song.artist == self)
        puts song.name
      end
    end
  end

  def self.all
    return @@all
  end



end

