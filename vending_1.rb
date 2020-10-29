class VendingMachine
  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @slot_money = 0
  end

  def current_slot_money
    puts @slot_money
  end

  def slot_money(money)
    if money == 0
      money = 0
      @slot_money = 0
      puts '----------------------------------------------------------------------------------------------'
    end
    puts "投入金額: #{money}円"
    @slot_money += money
    puts "何をしますか？"
    puts "0:購入, 1:払い戻し, 2:お金の投入"

    select_number = gets.chomp
    while true
      if select_number == "2"
        puts "お金を入れてください"
        money = gets.to_i
        return money unless MONEY.include?(money)
        @slot_money += money
        puts "投入金額: #{@slot_money}円"
        puts "何をしますか？"
        puts "0:購入, 1:払い戻し, 2:お金の投入"
        select_number = gets.chomp
      elsif select_number == "1"
        return @slot_money
      else
        return @slot_money
      end
    end
  end

  def return_money
    return @slot_money
    @slot_money = 0
  end
end



class Drink
  def initialize
    @water_stock = 5
    @cola_stock = 5
    @redbull_stock = 5
  end

  def buying(slot_money)
    if 100 <= slot_money && slot_money < 120
      puts 'どれを選びますか'
      puts "0:払い戻し, 1:お金の投入, 2:水"
      select_drink = gets.chomp
      select_drink
    elsif 120 <= slot_money && slot_money < 200
      puts 'どれを選びますか'
      puts "0:払い戻し, 1:お金の投入, 2:水, 3:コーラ"
      select_drink = gets.chomp
      select_drink
    elsif 200 <= slot_money
      puts 'どれを選びますか'
      puts "0:払い戻し, 1:お金の投入, 2:水, 3:コーラ, 4:レッドブル"
      # slot_money = 0
      select_drink = gets.chomp
      select_drink
    elsif slot_money < 100
      puts 'どれを選びますか'
      puts "0:払い戻し, 1:お金の投入"
      select_drink = gets.chomp
      select_drink
      # return slot_money
    else
      puts "その硬貨は存在しません"
      return slot_money
    end
  end

  def stock(drink,money)
    if drink == "2"
      @water_stock -= 1
      puts "水は残り#{@water_stock}本です"
      puts "水を購入しました"
      puts "お釣りは#{money - 100}円です"
      return true
    elsif drink == "3"
      @cola_stock -= 1
      puts "コーラは残り#{@cola_stock}本です"
      puts "コーラを購入しました"
      puts "お釣りは#{money - 120}円です"
      return true
    elsif drink == "4"
      @redbull_stock -= 1
      puts "レッドブルは残り#{@redbull_stock}本です"
      puts "レッドブルを購入しました"
      puts "お釣りは#{money - 200}円です"
      return true
    elsif drink == "0"
      puts "#{money}円の返却です"
    elsif drink == "1"
      vm = VendingMachine.new
      drink = Drink.new
      # vm.slot_money (money)
      # next_buy = true
      # while next_buy
      #   next_buy = drink.stock(drink.buying(vm.slot_money (money)),vm.return_money)
      # end
      # return false
      drink.stock(drink.buying(vm.slot_money (money)),vm.return_money)
    else
      puts "#{drink}円の返却"
      return true
    end
  end
  
end

# class People
#   def human1
#     vm = VendingMachine.new
#     drink = Drink.new
#     drink.stock(drink.buying(vm.slot_money (0)),vm.return_money)
#     vm.return_money
#   end
#   def human2
    
#   end
#   def human3
    
#   end
# end

  vm = VendingMachine.new
  drink = Drink.new
  
  next_buy = true
  while next_buy
    # @slot_money = 0
    next_buy = drink.stock(drink.buying(vm.slot_money (0)),vm.return_money)
  end
  # people = People.new
  
  # people.human1
  # vm.slot_money (100)
  # vm.current_slot_money
  # vm.return_money
