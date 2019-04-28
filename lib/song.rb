require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    new_song = Song.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    #binding.pry
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(title)
     if self.find_by_name(title)
       self.find_by_name(title)
     else
       self.create_by_name(title)
     end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.reformat_title(title)
    title.slice!(".mp3")
    file_arr = title.split(" - ")
    file_arr
  end

  Song.reformat_title("Little Dragon - Blinking Pigs.mp3")

  def self.new_from_filename(filename)
    file_arr = self.reformat_title(filename)
    new_song = self.new_by_name(file_arr[1])
    new_song.artist_name = file_arr[0]
    new_song
  end

  def self.create_from_filename(filename)
    file_arr = self.reformat_title(filename)
    new_song = self.create_by_name(file_arr[1])
    new_song.artist_name = file_arr[0]
    new_song
  end

  def self.destroy_all
    self.all.clear
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
