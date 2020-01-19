class Guest

  attr_accessor :name, :wallet, :favorite_song

  def initialize(name, wallet, favorite_song)
    @name = name
    @wallet = wallet
    @favorite_song = favorite_song
  end

  #methods

  def fee_reduce_wallet(fee)
    return @wallet -= fee
  end

  def bar_reduce_wallet(drinks, drink_name)
    for drink in drinks
      if drink_name == drink[:name]
        return @wallet -= drink[:price]
      end
    end
  end

  def playing_favourite_song(room)
    if room.songs.include?(@favorite_song)
      return "Whoo!"
    end
    return "Boo!"
  end

end
