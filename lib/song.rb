class Song
  attr_accessor :name, :artist_name
  attr_reader :save
  @@all = []

  def self.all
    @@all
  end

  # def initialized ()
  #   @name = ""
  #   @artist_name = ""
  # end


  def save
    self.class.all << self
  end
  def self.create
    n = self.new
    n.save
    
    n
    
  end
  def self.new_by_name(name)
    n = self.new
    # binding.pry
    n.name = name
    # binding.pry
    n
  end
  def self.create_by_name(name)
    k = self.new_by_name(name)
    k.save
    k
  end
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name):self.create_by_name(name)
     
  end
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  def self.new_from_filename(file)
    file_split = file.split (" - ")
    q = file_split[1].split(".")
    arist = file_split[0]
    song_name =q[0]
    ne = self.new
    ne.name = song_name
    ne.artist_name = arist
    ne
  end
  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end
  def self.destroy_all
    self.all.clear
  end
end
