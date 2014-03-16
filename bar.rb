require 'time' # you're gonna need it

class Bar
  attr_reader :name
  attr_writer :happy_discount
  attr_accessor :menu_items

  def initialize(name)
    @name = name
    @menu_items = []
  end

  def add_menu_item(item, price)
    menu_items.push(Item.new(item, price))
  end

  def happy_discount
    @happy_discount || 0
  end

end

class Item
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end

end
