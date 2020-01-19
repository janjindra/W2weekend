class Bar

  attr_accessor :drinks

  def initialize()
    @drinks = [{name:"beer",price:3},{name:"vodka",price:4},{name:"coke",price:2}]

  end

  #methods

  def bar_increase_till(room, drink_name)
    for drink in @drinks
      if drink_name == drink[:name]
        return room.till += drink[:price]
      end
    end
  end

end
