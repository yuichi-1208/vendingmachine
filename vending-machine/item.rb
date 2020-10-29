# require "csv"

class Item
  attr_reader :name, :price

  # def initialize(name:, price:, stock:)
  #   @name = name
  #   @price = price
  #   @stock = stock
  # end

  def item(drink, drink2, drink3)
    num = []
    num << drink
    num << drink2
    num << drink3
    num
  end

  # items = [
  #   {name: "コーラ", stock: 5, price: 120},
  #   {name: "水", stock: 5, price: 100},
  #   {name: "レッドブル", stock: 5, price: 200},
  # ]
  # items.map do
  # def self.import(path:)
  #   CSV.read(path, headers: true).map do |row|
  #     Item.new(
  #       name: row["name"],
  #       price: row["price"].to_i,
  #     )
  #   end
  # end
end
