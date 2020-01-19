require('minitest/autorun')
require('minitest/reporters')
require_relative('../song.rb')
require_relative('../room.rb')

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

class TestSong < MiniTest::Test

  def setup
    @song1 = Song.new("Hello")
    @song2 = Song.new("Rolling in the Deep")
    @song3 = Song.new("Set Fire to the Rain")
    @song4 = Song.new("Make You Feel My Love")
    @song5 = Song.new("Skyfall")
    @song6 = Song.new("Send My Love")

    @song7 = Song.new("Con Calma")
    @song8 = Song.new("Dark Horse")
    @song9 = Song.new("Roar")
    @song10 = Song.new("Firework")
    @song11 = Song.new("Never Really Over")

    @song12 = Song.new("Numb")
    @song13 = Song.new("In the End")
    @song14 = Song.new("What I've Done")
    @song15 = Song.new("New Divide")
    @song16 = Song.new("Crawling")

    @room1 = Room.new("RoomA", 2, 0, 5)
    @room2 = Room.new("RoomB", 3, 1, 6)
    @room3 = Room.new("RoomC", 6, 100, 20)

  end

  def test_has_name
    assert_equal("Hello", @song1.name)
  end

  def test_add_song_to_rooms
    @song1.add_song_to_rooms(@room1)
    @song2.add_song_to_rooms(@room1)
    @song3.add_song_to_rooms(@room1)
    @song4.add_song_to_rooms(@room1)
    @song5.add_song_to_rooms(@room1)
    @song6.add_song_to_rooms(@room1)
    assert_equal(6, @room1.songs.length)
  end


end
