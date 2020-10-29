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
  # ステップ０ お金の投入と払い戻しの例コード
  # ステップ１ 扱えないお金の例コード
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze
  # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
    #売り上げ金額
    @sales_money = 0
    # ドリンクの在庫
    @water_stock = 1
    @coke_stock = 2
    @redbull_stock = 3
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

  def money(slot_money)
    if 100 <= slot_money && slot_money < 120
      puts '----------------------------------------------------------------------------------------------'
      puts "投入金額: #{@slot_money}円"
      puts 'どれにしますか？'
      puts "1:水"
      puts '----------------------------------------------------------------------------------------------'
      select_drink = gets.chomp
      select_drink
    elsif 120 <= slot_money && slot_money < 200
      puts '----------------------------------------------------------------------------------------------'
      puts "投入金額: #{@slot_money}円"
      puts 'どれにしますか？'
      puts "1:水, 2:コーラ"
      puts '----------------------------------------------------------------------------------------------'
      select_drink = gets.chomp
      select_drink
    elsif 200 <= slot_money
      puts '----------------------------------------------------------------------------------------------'
      puts "投入金額: #{@slot_money}円"
      puts 'どれにしますか？'
      puts "1:水, 2:コーラ, 3:レッドブル"
      puts '----------------------------------------------------------------------------------------------'
      select_drink = gets.chomp
      select_drink
    else
      puts "お金が足りません"
    end
  end

  def stock(number)
    if number == "1" && 0 < @water_stock
      @water_stock -= 1
      @slot_money -= 100
      @sales_money += 100
      puts '----------------------------------------------------------------------------------------------'
      puts "水を購入しました！"
      puts "残金: #{@slot_money}円"
      puts "水の在庫: 残り#{@water_stock}本"
      puts '----------------------------------------------------------------------------------------------'
    elsif number == "2" && 0 < @coke_stock
      @coke_stock -= 1
      @slot_money -= 120
      @sales_money += 120
      puts '----------------------------------------------------------------------------------------------'
      puts "コーラを購入しました！"
      puts "残金: #{@slot_money}円"
      puts "コーラの在庫: 残り#{@coke_stock}本"
      puts '----------------------------------------------------------------------------------------------'
    elsif number == "3" && 0 < @redbull_stock
      @redbull_stock -= 1
      @slot_money -= 200
      @sales_money += 200
      puts '----------------------------------------------------------------------------------------------'
      puts "レッドブルを購入しました！"
      puts "残金: #{@slot_money}円"
      puts "レッドブルの在庫: 残り#{@redbull_stock}本"
      puts '----------------------------------------------------------------------------------------------'
    elsif number != "1" && number != "2" && number != "3"
      puts '----------------------------------------------------------------------------------------------'
      puts "残金: #{@slot_money}円"
      puts 'その番号は受け付けられません！'
      puts '----------------------------------------------------------------------------------------------'
    elsif @water_stock == 0 || @coke_stock == 0 || @redbull_stock == 0
      puts '----------------------------------------------------------------------------------------------'
      puts "残金: #{@slot_money}円"
      puts '売り切れです！'
      puts '----------------------------------------------------------------------------------------------'
    end
  end

  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
      # 返すお金の金額を表示する
      puts @slot_money
      # 自動販売機に入っているお金を0円に戻す
      @slot_money = 0
  end

  def sales
    puts "売り上げ: #{@sales_money}円"
  end

  def drink_stock
    puts "水の在庫: #{@water_stock}本"
    puts "コーラの在庫: #{@coke_stock}本"
    puts "レッドブルの在庫: #{@redbull_stock}本"
  end
end


require '/Users/oyamayuichi/workspace/vending_macine/vending_3.rb'
vm = VendingMachine.new

# vm.slot_money (100)
# vm.slot_money (1000)
vm.stock(vm.money(vm.current_slot_money))
# vm.return_money