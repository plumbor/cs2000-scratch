use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

data Payment:
  | cash
  | card(card-number :: String, expiry :: String)
  | venmo
  | checks(account-num :: String, routing :: String)
end


# in data science, we don'tmake numbers the Number data to it UNLESS we are doing math on it

p1 = "cash"
p2 = venmo
p3 = card()
p4 = checks()


data BookRecord:
  | book(title :: String, author :: String, pages :: Number)
end

