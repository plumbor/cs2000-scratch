use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

import lists as L

discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]

#map to upper case
#List operations have the order SWAPPED!!!

#L.map(lam(s :: String) -> String: string-to-upper(s) end , discount-codes)
discount-codes-upper = L.map(string-to-upper, discount-codes)

#Filtering out invalid codes
fun is-valid-code(s :: String) -> Boolean:
  doc: "Returns true if the code is not None"
  not(s == "NONE")
where:
  is-valid-code("VIP") is true
  is-valid-code("NONE") is false
end

discount-codes-valid = L.filter(is-valid-code, discount-codes-upper)
#What are all the discount codes people are using?

L.distinct(discount-codes-valid)

L.distinct([list: "yes", "NO", "maybe", "Yes", "no", "Maybe"])