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
    song = self.new
    #song.name = ""
    #song.artist_name = ""
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    #@@all << song
    song
  end

  def self.find_by_name(name)
    target = nil
    @@all.each do |song|
      target = song if song.name == name
    end
    target
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    artist_name = array[0]
    song_name = array[1].split(".")[0]
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    array = filename.split(" - ")
    artist_name = array[0]
    song_name = array[1].split(".")[0]
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all = []
  end

end
