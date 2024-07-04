def stock_picker(stock_arr)
  mod_arr = stock_arr
  highest_price = {profit: 0, buy_day: nil, sell_day: nil}
  while mod_arr.max > highest_price[:profit] || mod_arr.size < 2
    highest_stock = {value: mod_arr.max}; highest_stock[:day] = mod_arr.index(highest_stock[:value])
    lowest_stock = {value: mod_arr[0, highest_stock[:day]].min}; lowest_stock[:day] = mod_arr.index(lowest_stock[:value])
    unless lowest_stock[:day] == nil
      price = highest_stock[:value] - lowest_stock[:value]
    else
      price = 0
    end
    if price > highest_price[:profit]
      highest_price[:profit] = price
      highest_price[:buy_day] = lowest_stock[:day] + stock_arr.size - mod_arr.size
      highest_price[:sell_day] = highest_stock[:day] + stock_arr.size - mod_arr.size
    end
    mod_arr = mod_arr[highest_stock[:day]+1, mod_arr.size]
  end
  highest_price
end