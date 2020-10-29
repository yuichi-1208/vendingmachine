# irb

# require '/Users/oyamayuichi/workspace/vending_macine/vending_2.rb'
# （↑のパスは、自動販売機ファイルが入っているパスを指定する）
# # 初期設定（自動販売機インスタンスを作成して、vmという変数に代入する）
# vm = VendingMachine.new
# # 作成した自動販売機に100円を入れる
# vm.slot_money (100)
# # 作成した自動販売機に入れたお金がいくらかを確認する（表示する）
# vm.current_slot_money
# # 作成した自動販売機に入れたお金を返してもらう
# vm.return_money
# class VendingMachine
#   # ステップ０ お金の投入と払い戻しの例コード
#   # ステップ１ 扱えないお金の例コード
#   # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
#   MONEY = [10, 50, 100, 500, 1000].freeze
#   # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
#   def initialize(items:)
#     # 最初の自動販売機に入っている金額は0円
#     @slot_money = 0
#     #売り上げ金額
#     @sales_money = 0
#     # ドリンクの在庫
#     @items = items
#     @water_stock = 1
#     @coke_stock = 2
#     @redbull_stock = 3
#   end

#   def display
#     @items.each_with_index(1) do |item, index|
#       puts "#{index}. #{item.name}: #{item.price}円"
#     end
#   end

#   # 投入金額の総計を取得できる。
#   def current_slot_money
#     # 自動販売機に入っているお金を表示する
#     @slot_money
#   end
#   # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
#   # 投入は複数回できる。
#   def slot_money(money)
#     # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
#     # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
#     return false unless MONEY.include?(money)
#     # 自動販売機にお金を入れる
#     @slot_money += money
#     @slot_money
#   end

#   # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
#   def return_money
#       # 返すお金の金額を表示する
#       puts @slot_money
#       # 自動販売機に入っているお金を0円に戻す
#       @slot_money = 0
#   end

#   def sales
#     puts "売り上げ: #{@sales_money}円"
#   end

#   def sell(user, item)
#     puts "#{item.name} ですね。#{item.price}円 になります"
#     puts "#{user.money}円 頂戴します"
#     puts "お釣りは #{user.money - item.price}円 です"
#     puts "ゆっくり#{item.name}をお楽しみください"
#   end

# end
# item = user.choice(shop.items)
# vm.sell(@slot_money, item)



class Item
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end

  def self.import
    items = [
      {name: "coke", stock: 5, price: 120},
      {name: "water", stock: 5, price: 100},
      {name: "redbull", stock: 5, price: 200},
    ]
    items.each do |item|
      puts item["name"]
      puts item["price"].to_i
    end
  end

end

# class User
#   attr_reader :money

#   def initialize(money:)
#     @money = money
#   end

#   def choice(items)
#     print "ドリンクを選んでください > "
#     num = gets.to_i
#     items[num - 1]
#   end
# end





# require '/Users/oyamayuichi/workspace/vending_macine/vending_4.rb'
# vm = VendingMachine.new

# vm.slot_money (100)
# vm.slot_money (1000)
# vm.stock(vm.money(vm.current_slot_money))
# # vm.return_money




# items = Item.import(path: "items.csv")
# shop = Shop.new(name: SHOP_NAME, items: items)
# user = User.new(money: MONEY)

# shop.display
# item = user.choice(shop.items)
# shop.sell(user, item)