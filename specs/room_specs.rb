require('minitest/autorun')
require('minitest/reporters')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../bar.rb')

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

class TestRoom < MiniTest::Test

  def setup
    @room1 = Room.new("RoomA", 2, 0, 5)
    @room2 = Room.new("RoomB", 3, 1, 6)
    @room3 = Room.new("RoomC", 6, 100, 20)

    @guest1 = Guest.new("John", 50, "Roar")
    @guest2 = Guest.new("Jim", 10, "Rolling in the Deep")
    @guest3 = Guest.new("George", 100, "Set Fire to the Rain" )

    @bar = Bar.new()

  end

  def test_has_name
    assert_equal("RoomB",@room2.name)
  end

  def test_has_capacity
    assert_equal(3, @room2.capacity)
  end

  def test_has_till
    assert_equal(1, @room2.till)
  end

  def test_has_fee
    assert_equal(20, @room3.fee)
  end

  def test_guest_check_in__guest_added
    @room1.guest_check_in(@guest1, @room1)
    @room1.guest_check_in(@guest2, @room1)
    assert_equal(2,@room1.guests.length)
  end

  def test_guest_check_in__exceeds_capacity
    @room1.guest_check_in(@guest1, @room1)
    @room1.guest_check_in(@guest2, @room1)
    @room1.guest_check_in(@guest3, @room1)
    assert_equal(2,@room1.guests.length)
    assert_equal("Can't check in. The room #{@room1.name} is full!", @room1.guest_check_in(@guest3, @room1))
  end

  def test_guest_check_out__non_zero_guests_left
    @room3.guest_check_in(@guest1, @room3)
    @room3.guest_check_in(@guest2, @room3)
    @room3.guest_check_in(@guest3, @room3)
    @room3.guest_check_out(@guest1)
    assert_equal(2,@room3.guests.length)
  end

  def test_guest_check_out__zero_guests_left
    @room1.guest_check_in(@guest1, @room1)
    @room1.guest_check_out(@guest1)
    assert_equal(0,@room1.guests.length)
  end

  def test_guest_check_out__nobody_left_to_checkout
    @room1.guest_check_in(@guest2, @room1)
    @room1.guest_check_out(@guest2)
    @room1.guest_check_out(@guest1)
    assert_equal("Can't check out. There's nobody left in the room!",@room1.guest_check_out(@guest1))
    assert_equal(0,@room1.guests.length)
  end

  def test_guest_check_out__person_not_found
    @room1.guest_check_in(@guest2, @room1)
    @room1.guest_check_out(@guest1)
    assert_equal("Can't check out. This person is not in the room!",@room1.guest_check_out(@guest1))
    assert_equal(1,@room1.guests.length)
  end

  def test_fee_increase_till
    assert_equal(7,@room2.fee_increase_till(@room2.fee))
  end

  def test_guest_money_flow
    @room3.guest_check_in(@guest1, @room3)
    @room3.guest_check_in(@guest2, @room3)
    @room3.guest_check_out(@guest2)
    @guest1.fee_reduce_wallet(@room3.fee)
    @guest1.bar_reduce_wallet(@bar.drinks, "vodka")
    @room3.fee_increase_till(@room3.fee)
    @bar.bar_increase_till(@room3,"vodka")
    assert_equal(124, @room3.till)
    assert_equal(26, @guest1.wallet)
    assert_equal(1,@room3.guests.length)
  end

end
