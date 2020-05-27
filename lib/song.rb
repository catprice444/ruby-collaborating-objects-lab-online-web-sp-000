class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song(name)
  end

  def self.new_by_filename(filename)
    song = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    song = self.new(song)
    artist_name = Artist.find_or_create_by_name(filename)
    song
  end

end
