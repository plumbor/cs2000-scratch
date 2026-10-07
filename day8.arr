use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv

orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end
high-value-orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "10:15", 8.00
end


# two ways to do it

order-by(orders, "time", true)

orders.order-by("time",true)



fun is-high-value(r :: Row) -> Boolean:
  doc: "decides if the row is a high value order (more than or equal to 8)"
  # get-filter will run this function (high-value(1,2,3,4,...,n)
  value = get-column(r, "amount")
  if value >= 8:
    true
  else:
    false
  end
  # literally optional bruh vvvv
  where:
    # row 2 bc 0,1,2 so 2 is the 3rd row
    is-high-value(get-row(orders, 2)) is true
    is-high-value(get-row(orders,3)) is false
end

# filter-with(orders, is-high-value)

fun is-morning(r :: Row) -> Boolean:
  doc: "decides if the time column is in the morning"
  value = get-column(r, "time")
  if value < "12:00":
    true
  else:
    false
  end
end
  
  

table = load-table:
  one :: String,
  two :: String,
  three :: String
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/7-photos.csv", default-options)
end

fun is-forest(r :: Row) -> Boolean:
  doc: "decides if the column subject has forest"
  value = get-column(r, "two")
  if value == "Forest":
    true
  else:
    false
  end
end
  