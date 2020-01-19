require('minitest/autorun')
require('minitest/reporters')
require_relative('../bar.rb')
require_relative('../room.rb')
require_relative('../guest.rb')

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

class TestBar < MiniTest::Test

  def setup
    @room1 = Room.new("RoomA", 2, 0, 5)
    @room2 = Room.new("RoomB", 3, 1, 6)
    @room3 = Room.new("RoomC", 6, 100, 20)

    @guest1 = Guest.new("John", 50, "Roar")
    @guest2 = Guest.new("Jim", 10, "Rolling in the Deep")
    @guest3 = Guest.new("George", 100, "Set Fire to the Rain")

    @bar = Bar.new()

  end

  def test_bar_increase_till
    assert_equal(100,@room3.till)
    assert_equal(104,@bar.bar_increase_till(@room3,"vodka"))
    assert_equal(106,@bar.bar_increase_till(@room3,"coke"))
    assert_equal(109,@bar.bar_increase_till(@room3,"beer"))
  end

end
