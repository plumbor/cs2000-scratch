use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

# lambda functions (aka anonymous functions)

# they don't have a name

# just start w/ parameters

# lam() -> : end

# let's make a lambda for the square of a number

lam(num :: Number) -> Number : num * num end

# this is a use and throw version

prices = table: price
      row: 50
      row: 120
      row: 80
      row: 40
      row: 50
      row: 80
      row: 80
    end
freq-bar-chart(prices, "price")


# get column needs a row/table (in this case p) to get a column off of

build-column(prices, "sales tax", lam(p :: Row) -> Number: get-column(p, "price") * 0.05 end)
