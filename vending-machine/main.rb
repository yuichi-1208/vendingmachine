require "pry"
require_relative "item"
require_relative "vending"
require_relative "user"
require_relative "string"

SHOP_NAME = "自動販売機"
# MONEY = 3000

# # items = Item.import(path: "items.csv")
# drink = Item.new
# items = drink.item({name: "コーラ", stock: 5, price: 120},{name: "水", stock: 5, price: 100})
# puts items[0][:price] - 100
# vm = VendingMachine.new(name: SHOP_NAME, items: items)
# user = User.new(money: MONEY)

# vm.display
# item = user.choice(vm.items)
# vm.sell(user, item)

drink = Item.new
# items = drink.item({name: "コーラ", stock: 5, price: 120},{name: "水", stock: 5, price: 100},{name: "レッドブル", stock: 5, price: 200})
items = drink.item({name: "アンパン", stock: 5, price: 120},{name: "メロンパン", stock: 5, price: 100},{name: "クリームパン", stock: 5, price: 200})
vm = VendingMachine.new(items: items)
maney = vm.slot_money (1000)
vm.display
item = vm.choice(vm.items)
vm.sell(maney, item)
vm.return_money
vm.sales
