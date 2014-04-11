MENU = {
  "Happy Meal" => ["Cheese Burger", "French fries", "Coca"],
  "Best Of Big Mac" => ["Big Mac", "French fries", "Coca"],
  "Best Of Royal Cheese" => ["Royal Cheese", "Potatoes", "Sprite"]
}

CALORIES = {
  "Cheese Burger" => 290,
  "Big Mac" => 300,
  "Mc Bacon" => 400,
  "Royal Cheese" => 130,
  "French fries" => 130,
  "Potatoes" => 130,
  "Coca" => 160,
  "Sprite" => 170
}

def menu_calories_counter(menu)
  menu_calories = 0
  MENU[menu].each do |ingredient|
    menu_calories += CALORIES[ingredient]
  end
  menu_calories
end

def poor_calories_counter(burger, side, beverage)
  counter_calories = 0
  counter_calories = CALORIES[burger] + CALORIES[side] + CALORIES[beverage]
end

def calories_counter(*orders)
  counter_calories = 0
  orders.each do |order|
    if CALORIES[order] == nil
      counter_calories += menu_calories_counter(order)
    else
      counter_calories += CALORIES[order]
    end
  end
  counter_calories
end


