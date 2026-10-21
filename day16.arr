use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun my-doubles(l :: List<Number>) -> List<Number> block:
  doc: "return a new list with each value doubled"
  var new-list = [list: ]
  for each(number from l):
    new-list := new-list + [list: number * 2]
  end
  new-list
where:
  my-doubles([list: 1,2,3]) is [list: 2,4,6]
end



fun my-string-lens(l :: List<String>) -> List<Number> block:
  doc: "returns the list of lengths of each string in list"
  l.map(string-length)
where:
  my-string-lens([list: "lebron","james"]) is [list: 6,5]
end


fun my-alternating(l :: List) -> List block:
  doc: "returns every other element"
  var alt = [list: ]
  for each(e from l):
    if num-modulo(l.find(e), 2) == 1:
      alt := alt + [list: e]
    else:
      alt := alt + [list: ]
    end
  end
where:
  my-alternating([list: 1,2,3,4,5,6]) is [list: 1,3,5]
end
    