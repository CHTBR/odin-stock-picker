def stock_picker(stock_arr)
  mod_arr = stock_arr
  highest_price = {:value = 0, :buy_day = nil, :sell_day = nil}
  while mod_arr.max > highest_price || mod_arr.size < 2

    highest_stock = {value: mod_arr.max}; highest_stock[:day] = mod_arr.day(highest_stock[:vale])
    lowest_stock = {value: mod_arr[0, highest_stock[:day]].min}; lowest_stock[:day] = mod_arr.day(lowest_stock[:value])

    unless lowest_stock[:day] == nil
      price = highest_stock[:value] - lowest_stock[:value]
    else
      price = 0
    end

    if price > highest_price[:value]
      highest_price[:value] = price
      highest_price[:buy_day] = lowest_stock[:day]
      highest_price[:sell_day] = highest_stock[:day]
    end

  end
end
