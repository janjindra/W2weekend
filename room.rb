

class Room

  attr_accessor :name, :capacity, :songs, :guests, :till, :fee

  def initialize (name, capacity, till, fee)
    @name = name
    @capacity = capacity
    @songs = []
    @guests = []
    @till = till
    @fee = fee

  end

  #methods

  def guest_check_in(guest, room)
    if @guests.length < @capacity
      @guests.push(guest.name)
    end
    return "Can't check in. The room #{room.name} is full!"
  end


  def guest_check_out(guest)
    if @guests.empty? == true
      return "Can't check out. There's nobody left in the room!"
    elsif (@guests.include?(guest.name) == false)
      return "Can't check out. This person is not in the room!"
    else   @guests.delete(guest.name)
    end
  end

  def fee_increase_till(fee)
    return @till += fee
  end

  def guest_money_flow(guest)
    fee_increase_till(fee)
    guest.fee_reduce_wallet(fee)
  end

end
