use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


data Arrivals:
| no-arrivals
| arrival(ticket :: Number, item :: String, rest :: Arrivals)
end
data Rack:
| no-coats
| hook(ticket :: Number, item :: String, left :: Rack, right :: Rack)
end
lobby =
hook(40, "green parka",
hook(15, "umbrella", no-coats, hook(22, "denim jacket", no-coats, no-coats)),
hook(63, "wool coat", no-coats, no-coats))
late-crowd =
arrival(30, "rain jacket",
arrival(70, "umbrella",
arrival(5, "scarf", no-arrivals)))


fun largest-ticket(a :: Arrivals) -> Number block:
  doc: "which takes arrivals and returns the biggest ticket number among them, or `0` if there are no arrivals"
  cases (Arrivals) a:
    | no-arrivals => 0
    | arrival(t, i, r) => num-max(t, largest-ticket(r))
  end
where:
  largest-ticket(late-crowd) is 70
  largest-ticket(no-arrivals) is 0
  largest-ticket(arrival(12, "hat", no-arrivals)) is 12
end


fun rack-items(rack :: Rack) -> List<String>:
  doc: "returns a list of its items in order of their tickets, smallest ticket first"
  cases (Rack) rack:
    | no-coats => [list: ]
    | hook(t, i, l, r) => rack-items(l) + [list: i] +  rack-items(r)
  end
where:
  rack-items(no-coats) is [list: ]
  rack-items(hook(5, "scarf", no-coats, no-coats)) is [list: "scarf"]
  rack-items(lobby) is [list: "umbrella", "denim jacket", "green parka", "wool coat"]
end

fun check-in(rack :: Rack, t :: Number, i :: String) -> Rack:
  doc: "returns the rack with the item hung in the right place"
  cases (Rack) rack:
    | no-coats => hook(t, i, no-coats, no-coats)
    | hook(ticket, item, left, right) => 
      if t > ticket:
        hook(ticket, item, left, check-in(right, t, i))
      else:
        hook(ticket, item, check-in(right, t, i), right)
      end
  end
where:
  check-in(lobby, 70, "umbrella") is hook(40, "green parka",
hook(15, "umbrella", no-coats, hook(22, "denim jacket", no-coats, no-coats)),
hook(63, "wool coat", no-coats, hook(70, "umbrella", no-coats, no-coats)))
  check-in(no-coats, 8, "scarf") is hook(8, "scarf", no-coats, no-coats)
end


fun check-in-all(rack :: Rack, a :: Arrivals) -> Rack:
  doc: "returns the rack with every arriving item checked in"
  cases (Arrivals) a:
    | no-arrivals => rack
    | arrival(t, i, r) => check-in-all(check-in(rack, t, i), r)
  end
where:
  check-in-all(lobby, no-arrivals) is lobby
  check-in-all(no-coats, arrival(8, "scarf", no-arrivals)) is hook(8, "scarf", no-coats, no-coats)
  rack-items(check-in-all(lobby, late-crowd)) is [list: "scarf", "umbrella", "denim jacket", "rain jacket", "green parka", "wool coat", "umbrella"]
end