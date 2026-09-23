use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun choose-hat(temp :: Number) -> String:
  doc: "returns a message describing temp-appropriate head gear"
  condition1 = temp >= 55
  
  #tells u the temp for each test
  spy:
    temp,
    condition1
  end
  if temp >= 55:
    "no hat"
  else if  temp >= 80:
    "summer hat"
  else:
    "winter hat"
  end
  
where:
  choose-hat(40) is "winter hat"
  choose-hat(54.9) is "winter hat"
  choose-hat(55) is "no hat"
end


fun add-glasses(outfit :: String) -> String:
  doc: "adds glasses"
  outfit + ", and glasses"
end

fun choose-outfit(temp :: Number) -> String:
  doc: "chooses a fit"
  choose-hat(temp) + add-glasses("")
end