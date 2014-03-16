require 'time' # you're gonna need it

class Bar
  attr_reader :name
  attr_accessor :menu_items

  def initialize(name)
    @name = name
    @menu_items = []
  end

  def add_menu_item(item, price)
    menu_items.push(Item.new(item, price))
  end

end

class Item

  def initialize(item, price)
    @item = item
    @price = price
  end

end
