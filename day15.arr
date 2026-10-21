use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")






fun any-negative(nums :: List<Number>) -> Boolean block:
  doc: "returns true if list contains negative number"
  var x = false
  
  #iterate
  
  for each(number from nums):
    if number < 0:
      x := true
    else:
      x :=false
    end
  end
  x
  where:
  any-negative([list: 1, 2, 3, -4]) is true
  any-negative([list: 1, 2, 3, 4]) is false
end