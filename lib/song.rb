require 'pry'
class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end


  def self.new_by_name(song_name)
    new_song = self.create
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    @@all.map do |song|
      if song.name == song_name
        song
      end
    end.compact[0]
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |word|
      word.name
    end
  end

  def self.new_from_filename(filename)
    parsed_name = []
    parsed_name = filename.split(" - ")
    parsed_name[1].slice!(".mp3")

    new_song = self.new_by_name(parsed_name[1])
    new_song.artist_name = parsed_name[0]
    new_song

  end

  def self.create_from_filename(filename)
    parsed_name = []
    parsed_name = filename.split(" - ")
    parsed_name[1].slice!(".mp3")

    new_song = self.create_by_name(parsed_name[1])
    new_song.artist_name = parsed_name[0]
    new_song
  end

  def self.destroy_all
    @@all = []
  end

end
