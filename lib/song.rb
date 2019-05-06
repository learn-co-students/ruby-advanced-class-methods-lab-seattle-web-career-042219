require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize()
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.name = @name
    song.artist_name = @artist_name
    @@all<< song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all<< song
    song
  end

  def self.find_by_name(name)
    @@all.find{|song|song.name == name}

  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)==nil
      create_by_name(name)
    else
      find_by_name(name)
    end
  end

def self.alphabetical
  @@all.sort_by{|song|song.name}
end

def self.new_from_filename(file)
  ("Thundercat - For Love I Come.mp3")
  file_array = file.split("- ")
  @artist_name = file_array[0].strip
  name = file_array[1].to_s
  @name = name.split('.')[0]
  song = new_by_name(@name)
  song.artist_name = @artist_name
  song
end

def self.create_from_filename(file)
  @@all<<(new_from_filename(file))
end

def self.destroy_all
  @@all = []
end 


end
0
