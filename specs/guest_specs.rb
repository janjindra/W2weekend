require('minitest/autorun')
require('minitest/reporters')
require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../bar.rb')

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("John", 50, "Roar")
    @guest2 = Guest.new("Jim", 10, "Rolling in the Deep")
    @guest3 = Guest.new("George", 100, "Set Fire to the Rain" )

    @room1 = Room.new("RoomA", 2, 0, 5)
    @room2 = Room.new("RoomB", 3, 0, 6)
    @room3 = Room.new("RoomC", 6, 100, 20)

    @song8 = Song.new("Dark Horse")
    @song9 = Song.new("Roar")
    @song10 = Song.new("Firework")

    @bar = Bar.new()

  end

  def test_has_name
    assert_equal("John", @guest1.name)
  end

  def test_has_wallet
    assert_equal(10, @guest2.wallet)
  end

  def test_has_favorite_song
    assert_equal("Set Fire to the Rain", @guest3.favorite_song)
  end

  def test_fee_reduce_wallet
    assert_equal(80, @guest3.fee_reduce_wallet(@room3.fee))
    assert_equal(4, @guest2.fee_reduce_wallet(@room2.fee))
  end
  
  def test_bar_reduce_wallet
    assert_equal(100,@guest3.wallet)
    assert_equal(96,@guest3.bar_reduce_wallet(@bar.drinks, "vodka"))
    assert_equal(94,@guest3.bar_reduce_wallet(@bar.drinks, "coke"))
    assert_equal(91,@guest3.bar_reduce_wallet(@bar.drinks, "beer"))
  end

  def test_playing_favourite_song
    @song8.add_song_to_rooms(@room2)
    @song9.add_song_to_rooms(@room2)
    @song10.add_song_to_rooms(@room2)
    assert_equal(3, @room2.songs.length)
    assert_equal("Whoo!", @guest1.playing_favourite_song(@room2))
    assert_equal("Boo!", @guest3.playing_favourite_song(@room2))
  end

end
