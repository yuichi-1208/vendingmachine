class User
  attr_reader :money

  def initialize(money:)
    @money = money
  end

  def choice(items)
    print "ドリンクを選んでください > "
    num = gets.to_i
    items[num - 1]
  end
end