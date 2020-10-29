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
class VendingMachine
  # ステップ０　お金の投入と払い戻しの例コード
  # ステップ１　扱えないお金の例コード
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze
  # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
  end
  # 投入金額の総計を取得できる。
  def current_slot_money
    # 自動販売機に入っているお金を表示する
    @slot_money
  end
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  # 投入は複数回できる。
  def slot_money(money)
    # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
    # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
    return false unless MONEY.include?(money)
    # 自動販売機にお金を入れる
    @slot_money += money
    @slot_money
  end
  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
     # 返すお金の金額を表示する
      puts @slot_money
      # 自動販売機に入っているお金を0円に戻す
      @slot_money = 0
  end
end


class Drink < VendingMachine

  def initialize
    @water_stock = 1
    @coke_stock = 2
    @redbull_stock = 3
  end

  def current_slot_money
    super
  end
  

  def money(slot_money)
    if 100 <= slot_money && slot_money < 120
      puts 'どれにしますか？'
      puts "1:水"
      select_drink = gets.chomp
      select_drink
    elsif 120 <= slot_money && slot_money < 200
      puts 'どれにしますか？'
      puts "1:水, 2:コーラ"
      select_drink = gets.chomp
      select_drink
    elsif 200 <= slot_money
      puts 'どれにしますか？'
      puts "1:水, 2:コーラ, 3:レッドブル"
      select_drink = gets.chomp
      select_drink
    end
  end

  def stock(number,money)
    if number == "1" && 0 < @water_stock
      @water_stock -= 1
      @slot_money = money - 100
      puts "水は、残り#{@water_stock}本です"
    elsif number == "2" && 0 < @coke_stock
      @coke_stock -= 1
      @slot_money = money - 120
      puts "コーラは、残り#{@coke_stock}本です"
    elsif number == "3" && 0 < @redbull_stock
      @redbull_stock -= 1
      @slot_money = money - 200
      puts "レッドブルは、残り#{@redbull_stock}本です"
    else
      puts '売り切れです'
    end
  end

  def return_money(drink,money)
    if drink == 1
      money -= 100
      puts money
      # 自動販売機に入っているお金を0円に戻す
      money = 0
    elsif drink == 2
      money -= 120
      puts money
      # 自動販売機に入っているお金を0円に戻す
      money = 0
    elsif drink == 3
      money -= 200
      puts money
      # 自動販売機に入っているお金を0円に戻す
      money = 0
    end
  end
  
  def drink_stock
    puts "水の在庫: #{@water_stock}本"
    puts "コーラの在庫: #{@coke_stock}本"
    puts "レッドブルの在庫: #{@redbull_stock}本"
  end
end

# class Stock

# end


# 初期設定（自動販売機インスタンスを作成して、vmという変数に代入する）
require '/Users/oyamayuichi/workspace/vending_macine/vending_2.rb'
vm = VendingMachine.new
drink = Drink.new
# 作成した自動販売機に100円を入れる
# vm.slot_money (100)
# vm.slot_money (1000)
# # 作成した自動販売機に入れたお金がいくらかを確認する（表示する）
# drink.stock(drink.money(vm.current_slot_money))
# drink.stock(drink.money(vm.current_slot_money),vm.current_slot_money)
# drink.drink_stock
# 作成した自動販売機に入れたお金を返してもらう
# vm.return_money