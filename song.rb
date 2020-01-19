class Song

  attr_accessor :name

  def initialize (name)
    @name = name
  end

  #methods

def add_song_to_rooms(room)
  room.songs.push(@name)
end


end
