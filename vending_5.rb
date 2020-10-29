class VendingMachine
  attr_reader :items

  def initialize(items:)
    @items = items
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
    #売り上げ金額
    @sales_money = 0
  end

  MONEY = [10, 50, 100, 500, 1000].freeze

  def current_slot_money
    puts "投入金額:#{@slot_money}円"
    @slot_money
  end

  def slot_money(money)
    return "お取り扱いできません" unless MONEY.include?(money)
    @slot_money += money
    puts "投入金額:#{@slot_money}円"
  end

  def return_money
    puts "お釣りは #{@slot_money}円です"
    @slot_money = 0
  end

  def sales
    puts "売り上げ: #{@sales_money}円"
  end

  def display
    puts "メニューはこちらです"
    puts "*" * 50
    # if @items[0][:stock] > 0
      puts "1: #{@items[0][:name]} (#{@items[0][:price]}円)"
    # elsif @items[1][:stock] > 0
      puts "2: #{@items[1][:name]} (#{@items[1][:price]}円)"
    # elsif @items[2][:stock] > 0
      puts "3: #{@items[2][:name]} (#{@items[2][:price]}円)"
    # end
    puts "*" * 50
  end

  def choice(items)
    print "商品番号を入力してください > "
    num = gets.to_i
    items[num - 1]
  end

  def sell(money, item)
    if item[:stock] > 0 && money >= item[:price]
      puts "#{item[:name]} を購入!"
      puts "#{item[:name]} が下から出てきます。忘れずにおとりください。"
      item[:stock] -= 1
      @sales_money += item[:price]
      @slot_money = money - item[:price]
      puts "ありがとうございました。"
      puts "現在の投入金額: #{@slot_money}円"
    elsif item[:stock ] == 0
      puts "売り切れです。"
      puts "現在の投入金額: #{@slot_money}円"
    else money < item[:price]
      puts "投入金額が足りません。"
      puts "現在の投入金額: #{@slot_money}円"
    end
  end

end


class Item
  def initialize
    @item = []
  end

  def add_item(name, price, stock)
    if @item.length < 3
      @item.push({name: name, price: price, stock: stock})
    else
      puts "これ以上商品を追加できません"
    end
  end

  def item_reset
    @item = []
  end

  def current_item
    @item
  end

  def item_stock
    @item.each do |item|
      puts "#{item[:name]}: #{item[:stock]}個"
    end
  end
end


# require '/Users/oyamayuichi/workspace/vending_macine/vending_5.rb'
# diet = Item.new
# diet.item_reset
# diet.add_item("コーラ", 120, 5)
# diet.add_item("水", 100, 5)
# diet.add_item("レッドブル", 200, 5)
# diet.item_stock
# items = diet.current_item
# vm = VendingMachine.new(items: items)
# vm.slot_money (1000)
# money = vm.current_slot_money
# vm.display
# item = vm.choice(vm.items)
# vm.sell(money, item)
# vm.return_money
# vm.sales

# 課題は購入したあとの在庫の管理