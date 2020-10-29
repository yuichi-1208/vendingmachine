class VendingMachine
  attr_reader :items

  def initialize(items:)
    # @name = name
    @items = items
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
    #売り上げ金額
    @sales_money = 0
  end

  MONEY = [10, 50, 100, 500, 1000].freeze

  def current_slot_money
    @slot_money
  end

  def slot_money(money)
    return false unless MONEY.include?(money)
    @slot_money += money
    @slot_money
  end

  def display
    puts "ようこそ"
    puts "メニューはこちらです"
    puts "*" * 50
    # @items.each.with_index(1) do |item, index|
    #   puts "#{index.to_s.rjust(2)}. #{item.name.mb_ljust(24)}: #{item.price.to_s.rjust(4)}円"
    # end
    puts "1: #{@items[0][:name]}"
    puts "2: #{@items[1][:name]}"
    puts "3: #{@items[2][:name]}"
    puts "*" * 50
  end

  def choice(items)
    print "商品を選んでください > "
    num = gets.to_i
    items[num - 1]
  end

  def sell(user, item)
    puts "#{item[:name]} ですね。#{item[:price]}円 になります"
    puts "#{user}円 頂戴します"
    @sales_money += item[:price]
    @slot_money = user - item[:price]
    # puts "お釣りは #{user - item[:price]}円 です"
    puts "ゆっくり#{item[:name]}をお楽しみください"
  end

  def return_money
    # 返すお金の金額を表示する
    puts "お釣りは #{@slot_money}円です"
    # 自動販売機に入っているお金を0円に戻す
    @slot_money = 0
  end

  def sales
    puts "売り上げ: #{@sales_money}円"
  end
end