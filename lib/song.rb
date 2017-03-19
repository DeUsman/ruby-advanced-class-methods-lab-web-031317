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
    song = self.new
    @@all.push(song)
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
    end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all.push(song)
    song
end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
    end
   def self.find_or_create_by_name(song_name)
     if (!self.find_by_name(song_name))
        song = Song.new
        song.name = song_name
        song
      end
    end

    def self.alphabetical
      self.all.sort_by do |song| song.name end
    end

    def self.new_from_filename(file)
      file_format = file.split(/[-.]/)
      artist = file_format[0].strip
      song_title = file_format[1].strip
      new_song = self.new_by_name(song_title)
      new_song.artist_name = artist
      new_song
 end

    def self.create_from_filename(song)
      file_format = song.split(/[-.]/)
      artist = file_format[0].strip
      song_title = file_format[1].strip
      new_song = self.create_by_name(song_title)
      new_song.artist_name = artist
      new_song
    end

    def self.destroy_all
      self.all.clear
    end
end
