require "pry"

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
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      return song if song.name == name
    end
    nil
  end

  def self.find_or_create_by_name(name)
   if self.find_by_name(name) == nil
     self.create_by_name(name)
   else
     self.find_by_name(name)
   end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    new_song = Song.new
    filename_array = filename.split(".")
    filename_array = filename_array[0].split(" - ")
    new_song.artist_name = filename_array[0]
    new_song.name = filename_array[1]
    new_song
  end

  def self.create_from_filename(filename)
    new_song = Song.new
    filename_array = filename.split(".")
    filename_array = filename_array[0].split(" - ")
    new_song.artist_name = filename_array[0]
    new_song.name = filename_array[1]
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all.clear
  end
end
