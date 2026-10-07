use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

  items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
    row: "Sword of Dawn",           23,  -87
    row: "Healing Potion",         -45,   12
    row: "Dragon Shield",           78,  -56
    row: "Magic Staff",             -9,   64
    row: "Elixir of Strength",      51,  -33
    row: "Cloak of Invisibility",  -66,    5
    row: "Ring of Fire",            38,  -92
    row: "Boots of Swiftness",     -17,   49
    row: "Amulet of Protection",    82,  -74
    row: "Orb of Wisdom",          -29,  -21
  end

#coordinates = distance from top left


#input should be a row (bc we need to follow instructions for build-column)
fun distance(row :: Row) -> Number:
  doc: "computes distance using x and y coordinates"
  # take the x and y from the row data
  x = get-column(row, "x-coordinate")
  y = get-column(row, "y-coordinate")
  num-sqrt(num-sqr(x) + num-sqr(y))
where:
  distance(get-row(items,0)) is-roughly num-sqrt(num-sqr(23) + num-sqr(-87))
end

items-with-dist = build-column(items, "distance", distance)

fun subtract-10(n :: Number) -> Number:
  doc: "subtracts 1 from input"
  n - 10
where:
  subtract-10(10) is 0
  subtract-10(0) is -10
  subtract-10(-3.5) is -13.5
end

# transform-column(items, "x-coordinate", subtract-10)

# USE LAMBDA INSTEAD BC LESS WRITING

transform-column(items, "x-coordinate", lam(n :: Number) -> Number: n - 10 end)




check:
  test-table = table: x-coordinate :: Number
    row: 23
    row: -45
  end
  expected-table = table: x-coordinate :: Number
    row: 23 - 10
    row: -45 - 10
  end
  transform-column(test-table, "x-coordinate", lam(n :: Number) -> Number: n - 10 end) is expected-table
end








# last prob

fun subtract-10-percent(n :: Number) -> Number:
  doc: "subtracts 1 from input"
  sub = 0.1 * n
  n - sub
where:
  subtract-10-percent(10) is-roughly 9
end

transform-column(items, "x-coordinate", subtract-10-percent)

transform items using x-coordinate, y-coordinate:
  x-coordinate: x-coordinate * 0.9,
  y-coordinate: y-coordinate * 0.9
end